import 'package:flutter/material.dart';
import 'package:myapp/Page/my_Homepage.dart';
import 'SecondPage.dart';

void main() {
  runApp(const MaterialApp(
    home: EKTPPage(),
  ));
}

class EKTPPage extends StatefulWidget {
  const EKTPPage({super.key});

  @override
  _EKTPPageState createState() => _EKTPPageState();
}

class _EKTPPageState extends State<EKTPPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _selectedGender;
  String? _selectedBloodType;

  List<String> fieldLabels = [
    'NIK (Nomor Induk Kependudukan)',
    'Nama Lengkap',
    'Tempat Lahir',
    'Tanggal Lahir',
  ];

  List<String> fieldValues = ['', '', '', ''];

  void navigateToNextPage() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Pembuatan E-KTP'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const MyHomePage()));
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
                  children: [TextFormField(
                  decoration: InputDecoration(
                    labelText: fieldLabels[index], 
                    border: const OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap Isi Kolom ${fieldLabels[index]}';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      fieldValues[index] = value;
                    });
                  },
                ),
                if (index< fieldLabels.length - 1)
                const Divider(
                  height: 15,
                )
                ],);
              }),
              const SizedBox(height: 20),
              const Text('Jenis Kelamin:'),
              Row(
                children: [
                  Expanded(
                    child:ListTile(
                title: const Text('Laki-laki'),
                leading: Radio<String>(
                  value: 'Laki-laki',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
              ),
              Expanded(
                child: ListTile(
                title: const Text('Wanita'),
                leading: Radio<String>(
                  value: 'Wanita',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              )
              )
              ],
              ),
              const SizedBox(height: 20),
              const Text('Golongan Darah:'),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3, // Adjust as needed
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final bloodTypes = ['A', 'B', 'AB', 'O'];
                  final bloodType = bloodTypes[index];
                  return GridTile(
                    child: ListTile(
                      title: Text(bloodType),
                      leading: Radio<String>(
                        value: bloodType,
                        groupValue: _selectedBloodType,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedBloodType = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: navigateToNextPage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(255, 109, 2, 1),
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
            ],
          ),
        ),
      ),
    );
  }
}
