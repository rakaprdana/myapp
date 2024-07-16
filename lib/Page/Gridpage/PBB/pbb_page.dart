import 'package:flutter/material.dart';

class PBBPage extends StatelessWidget {
  const PBBPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PBB'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman PBB'),
      ),
    );
  }
}
