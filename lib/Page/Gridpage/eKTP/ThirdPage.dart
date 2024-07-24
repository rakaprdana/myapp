import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/eKTP/SecondPage.dart';
import 'package:myapp/Page/Gridpage/eKTP/StatusPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThirdPage(),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final formKey = GlobalKey<FormState>();
  List<String> fieldLabels = [
    'Pekerjaan',
    'Kewarganegaraan',
  ];
  List<String> fieldValues = ['', '']; // Ubah jumlah elemen menjadi sesuai dengan fieldLabels

  void navigateToNextPage() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StatusPageEKTP()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e-KTP'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              ...List.generate(fieldLabels.length, (index) {
                return Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: fieldLabels[index],
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harap isi kolom ${fieldLabels[index]}';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          fieldValues[index] = value;
                        });
                      },
                    ),
                    if (index < fieldLabels.length - 1)
                      Divider(
                        height: 15,
                      )
                  ],
                );
              }),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: navigateToNextPage,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(255, 109, 2, 1),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('SELANJUTNYA', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
