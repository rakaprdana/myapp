import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/eKTP/ThirdPage.dart';
import 'package:myapp/Page/Gridpage/eKTP/e_ktp_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondPage(),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  final formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController rtController = TextEditingController();
  final TextEditingController rwController = TextEditingController();
  String? _selectedMarried;

  List<String> fieldLabels = [
    'Kelurahan/Desa',
    'Kecamatan',
    'Agama',
  ];
  List<String> fieldValues = ['', '', '', ''];
  void navigateToNextPage() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThirdPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e - KTP'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => EKTPPage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat Lengkap',
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
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: rtController,
                      decoration: InputDecoration(
                        labelText: 'RT',
                        border: OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Harap Isi Kolom';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: rwController,
                      decoration: InputDecoration(
                        labelText: 'RW',
                        border: OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Harap Isi Kolom';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ...List.generate(fieldLabels.length, (index) {
                return Column(
                  children: [TextFormField(
                  decoration: InputDecoration(
                    labelText: fieldLabels[index], 
                    border: OutlineInputBorder()),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Harap Isi Kolom ${fieldLabels[index]}';
                  //   }
                  //   return null;
                  // },
                  onChanged: (value) {
                    setState(() {
                      fieldValues[index] = value;
                    });
                  },
                ),
                if (index< fieldLabels.length - 1)
                Divider(
                  height: 25,
                )
                ],);
              }),
              const SizedBox(height: 20),
              const Text('Status Pernikahan:'),
              Row(
                children: [
                  Expanded(
                    child:ListTile(
                title: const Text('Sudah Menikah'),
                leading: Radio<String>(
                  value: 'Sudah',
                  groupValue: _selectedMarried,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedMarried = value;
                    });
                  },
                ),
              ),
              ),
              Expanded(
                child: ListTile(
                title: const Text('Belum Menikah'),
                leading: Radio<String>(
                  value: 'Belum',
                  groupValue: _selectedMarried,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedMarried = value;
                    });
                  },
                ),
              )
              )
              ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                onPressed: navigateToNextPage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(255, 109, 2, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('SELANJUTNYA'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
