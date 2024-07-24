import 'package:flutter/material.dart';
import 'package:myapp/Page/my_Homepage.dart'; 

void main() {
  runApp(const StatusPageLaporan());
}

class StatusPageLaporan extends StatefulWidget {
  const StatusPageLaporan({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPageLaporan> {
  

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imunisasi'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color.fromRGBO(223, 245, 255, 1), 
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/icon/background.png', 
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8), // Slightly transparent background
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'STATUS',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 50),
                        const Icon(Icons.check_circle, size: 50, color: Colors.green),
                        const SizedBox(height: 10),
                        const Text(
                          'Pendaftaran Berhasil',
                          
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Tunjukkan Kode ke Administrasi',
                          ),
                        
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MyHomePage()),
                            );
                          },
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
                          child: const Text('BERANDA'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
