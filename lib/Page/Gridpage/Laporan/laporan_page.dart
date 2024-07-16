import 'package:flutter/material.dart';

class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LaporanPageContent(),
    );
  }
}

class LaporanPageContent extends StatefulWidget {
  @override
  _LaporanPageContentState createState() => _LaporanPageContentState();
}

class _LaporanPageContentState extends State<LaporanPageContent> {
  final formKey = GlobalKey<FormState>();

  // Form Field Controller
  final TextEditingController judulController = TextEditingController();
  final TextEditingController isiController = TextEditingController();
  final TextEditingController kontakController = TextEditingController();
  String? _selectedCategory;

  final List<String> categories = ['Infrastruktur', 'Lingkungan', 'Layanan Publik'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan'),
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
                  return ListTile(
                    title: Text(category),
                    leading: Radio<String>(
                      value: category,
                      groupValue: _selectedCategory,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
