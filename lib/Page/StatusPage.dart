import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/eKTP/StatusPage.dart';
import 'package:myapp/Page/Gridpage/Imunisasi/StatusPage.dart';
import 'package:myapp/Page/my_Homepage.dart';



class AllStatusPage extends StatelessWidget {
  const AllStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Status'),
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
                  'assets/icon/ektpIcon.png'), // Replace with your asset image
              title: Text('Cek Status Pendaftaran KTP'),
              onTap: () {
                //navigasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatusPageEKTP()),
                );
              },
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Image.asset(
                  'assets/icon/imunisasiIcon.png'),
              title: Text('Cek Status Pendaftaran Imunisasi'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatusPageImunisasi()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
