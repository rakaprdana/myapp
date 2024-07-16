import 'package:flutter/material.dart';
import 'package:myapp/Page/Gridpage/Imunisasi/imunisasi_page.dart';
import 'package:myapp/Page/Gridpage/Laporan/laporan_page.dart';
import 'package:myapp/Page/Gridpage/PBB/pbb_page.dart';
import 'package:myapp/Page/Gridpage/eKTP/optionPage.dart';
import 'option_card.dart';

class GridOptions extends StatelessWidget {
  const GridOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        children: const [
          OptionCard(title: 'e-KTP', icon: Icons.credit_card, page: EKTPOptionpage()),
          OptionCard(title: 'Laporan', icon: Icons.report, page:  LaporanPage()),
          OptionCard(title: 'PBB', icon: Icons.home, page:  PBBPage()),
          OptionCard(title: 'Imunisasi', icon: Icons.health_and_safety, page: FormImunisasiPage()),
        ],
      ),
    );
  }
}
