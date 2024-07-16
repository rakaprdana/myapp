import 'package:flutter/material.dart';
import '../Page/AnnoucementPage/BikinKTPPage.dart';
import '../Page/AnnoucementPage/ImunisasiPage.dart';
import '../Page/AnnoucementPage/PengaduanPage.dart';

class AnnouncementSection extends StatelessWidget {
  AnnouncementSection({super.key});

  final List<String> images = [
    'assets/image/Imunisasi.jpg',
    'assets/image/BikinKTP.jpg',
    'assets/image/Pengaduan.png',
  ];

  final List<String> titles = [
    'Layanan Imunisasi',
    'Pembuatan KTP',
    'Pengaduan Masyarakat',
  ];

  final List<Widget> pages = [
    ImunisasiPage(),
    BikinKTPPage(),
    PengaduanPage(),
  ];

  @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pages[index]),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Warna putih dengan opacity
                borderRadius: BorderRadius.circular(12.0), // Menambahkan rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(16, 10, 10, 10) , // Margin di luar container
              padding: const EdgeInsets.all(4.0), // Padding di dalam container
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // Menambahkan rounded corners
                    child: Image.asset(
                      images[index],
                      width: 280,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    titles[index],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
