import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/eKTP/StatusPage.dart';
import 'package:myapp/Page/my_Homepage.dart';
import './e_ktp_page.dart';

class EKTPOptionpage extends StatelessWidget {
  const EKTPOptionpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e-KTP'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyHomePage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Image.asset(
                  'assets/image/icon/ektp.png'), // Replace with your asset image
              title: Text('Formulir Pendaftaran KTP'),
              onTap: () {
                //navigasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EKTPPage()),
                );
              },
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Cek Status Pendaftaran'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatusPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
