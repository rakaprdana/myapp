import 'package:flutter/material.dart';
import '../Section/announcement_section.dart';
import '../Section/user_profile_section.dart';
import '../Grid/grid_options.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(6, 9), // Posisi Shadow
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 231, 244, 250), // Warna background navbar
            elevation: 0,
            automaticallyImplyLeading: false, // Hilangkan tombol back
            title: Row(
              children: [
                Image.asset(
                  'assets/icon/logo_SeviGO.png', // Path ke gambar ikon dashboard
                  width: 30, // Sesuaikan ukuran gambar sesuai kebutuhan
                  height: 30,
                ),
                const SizedBox(width: 8), // Jarak antara gambar dan teks
                const Text('Dashboard'),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background color
          Positioned.fill(
            child: Container(
              color: const Color.fromRGBO(223, 245, 255, 1), // Warna background dengan RGB (223, 245, 255)
            ),
          ),
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/icon/background.png', // Path ke gambar latar belakang
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                UserProfileSection(),
                AnnouncementSection(),
                GridOptions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}
