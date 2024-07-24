import 'package:flutter/material.dart';
import 'package:myapp/Page/ProfilePage/ProfileScreen.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0), // Menambahkan const
      width: 350,
      height: 100,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 28, 106, 1),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: const AssetImage('assets/icon/bg-profile.png'), 
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color.fromRGBO(33, 28, 106, 1).withOpacity(0.5), // Mengatur opacity dan warna overlay
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'RAKA PRADANA MARTIANUS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'NIK: 313209110403007',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
