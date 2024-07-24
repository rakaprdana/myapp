import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/eKTP/e_ktp_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DetailPage.dart';

void main() {
  runApp(const MaterialApp(
    home: SecondPage(),
  ));
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController tahunController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController luasBangunanController = TextEditingController();
  final TextEditingController luasTanahController = TextEditingController();
  final TextEditingController uangController = TextEditingController();

  Future<void> navigateToNextPage() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('tahun', tahunController.text);
      await prefs.setString('alamat', alamatController.text);
      await prefs.setString('luasBangunan', luasBangunanController.text);
      await prefs.setString('luasTanah', luasTanahController.text);
      await prefs.setString('uang', uangController.text);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pajak Bumi dan Bangunan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EKTPPage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: tahunController,
                decoration: InputDecoration(
                  labelText: 'Tahun Pajak',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tahun Pajak harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: luasTanahController,
                      decoration: InputDecoration(
                        labelText: 'Luas Tanah',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Luas Tanah harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: luasBangunanController,
                      decoration: InputDecoration(
                        labelText: 'Luas Bangunan',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Luas Bangunan harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: uangController,
                decoration: InputDecoration(
                  labelText: 'Jumlah Pajak Terutang',
                  prefixText: 'Rp ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah Pajak Terutang harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: navigateToNextPage,
                child: Text('SELANJUTNYA'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(255, 109, 2, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
