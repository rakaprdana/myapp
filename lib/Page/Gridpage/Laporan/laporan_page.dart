import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/Laporan/StatusPage.dart';
void main() {
  runApp(const MaterialApp(
    home: LaporanPage(),
  ));
}
class LaporanPage extends StatefulWidget {
  const LaporanPage({Key? key}) : super(key: key);
  @override
  _LaporanPageContentState createState() => _LaporanPageContentState();
}

class _LaporanPageContentState extends State<LaporanPage> {
  final formKey = GlobalKey<FormState>();

  // Form Field Controller
  final TextEditingController judulController = TextEditingController();
  final TextEditingController isiController = TextEditingController();
  final TextEditingController kontakController = TextEditingController();
  String? _selectedCategory;

  final List<String> categories = ['Infrastruktur', 'Lingkungan', 'Layanan Publik'];

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed
    judulController.dispose();
    isiController.dispose();
    kontakController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: judulController,
                decoration: InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap Isi Kolom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: isiController,
                decoration: InputDecoration(
                  labelText: 'Isi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap Isi Kolom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              const Text('Kategori Laporan'),
              Column(
                children: categories.map((category) {
                  return RadioListTile<String>(
                    title: Text(category),
                    value: category,
                    groupValue: _selectedCategory,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatusPageLaporan()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Harap lengkapi semua kolom dan pilih kategori.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(255, 109, 2, 1),
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('KIRIM'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
