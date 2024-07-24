import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/PBB/StatusPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatelessWidget {
  Future<Map<String, String>> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'nama': prefs.getString('nama') ?? '',
      'ktp': prefs.getString('ktp') ?? '',
      'email': prefs.getString('email') ?? '',
      'telepon': prefs.getString('telepon') ?? '',
      'nop': prefs.getString('nop') ?? '',
      'tahun': prefs.getString('tahun') ?? '',
      'alamat': prefs.getString('alamat') ?? '',
      'luasBangunan': prefs.getString('luasBangunan') ?? '',
      'luasTanah': prefs.getString('luasTanah') ?? '',
      'uang': prefs.getString('uang') ?? '',
    };
  }

  void navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StatusPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pajak Bumi dan Bangunan'),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            final dataEntries = [
              {'label': 'Nama Lengkap', 'value': data['nama']},
              {'label': 'No. KTP', 'value': data['ktp']},
              {'label': 'Email', 'value': data['email']},
              {'label': 'Nomor Telepon', 'value': data['telepon']},
              {'label': 'NOP', 'value': data['nop']},
              {'label': 'Tahun', 'value': data['tahun']},
              {'label': 'Alamat', 'value': data['alamat']},
              {'label': 'Luas Tanah', 'value': data['luasTanah']},
              {'label': 'Luas Bangunan', 'value': data['luasBangunan']},
              {'label': 'Jumlah Pajak Terutang', 'value': 'Rp ${data['uang']}'},
            ];

            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: const Color.fromRGBO(223, 245, 255, 1), // Warna background dengan RGB (223, 245, 255)
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icon/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Konten di atas gambar latar belakang
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: dataEntries.map((entry) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('${entry['label']}: ${entry['value']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      )),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => navigateToNextPage(context),
                            child: Text('SELANJUTNYA'),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
