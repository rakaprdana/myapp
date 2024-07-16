import 'package:flutter/material.dart';
import '../../Components/Text/annoucement_text.dart';


class BikinKTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengumuman'),
        backgroundColor: const Color.fromRGBO(223, 245, 255, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/image/BikinKTP.jpg'), // Gambar di atas pengumuman
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var line in annoucementEKTPText.split('\n')) 
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          line.replaceAll('#', ''), // Remove the tag
                          style: line.startsWith('#')
                              ? TextStyle(
                                  fontSize: 24, 
                                  fontWeight: FontWeight.bold, 
                                  color: Color.fromRGBO(33, 28, 106, 1))
                              : TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify, // Set text alignment to justify
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BikinKTPPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
