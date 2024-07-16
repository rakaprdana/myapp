import 'package:flutter/material.dart';

class RadioWidgetGol extends StatefulWidget {
  @override
  _RadioWidgetGolState createState() => _RadioWidgetGolState();
}

class _RadioWidgetGolState extends State<RadioWidgetGol> {
  String? _golonganDarah = 'A'; // Set default value if needed

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Golongan Darah'),
        ListTile(
          title: const Text('A'),
          leading: Radio<String>(
            value: 'A',
            groupValue: _golonganDarah,
            onChanged: (String? value) {
              setState(() {
                _golonganDarah = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('B'),
          leading: Radio<String>(
            value: 'B',
            groupValue: _golonganDarah,
            onChanged: (String? value) {
              setState(() {
                _golonganDarah = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('AB'),
          leading: Radio<String>(
            value: 'AB',
            groupValue: _golonganDarah,
            onChanged: (String? value) {
              setState(() {
                _golonganDarah = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('O'),
          leading: Radio<String>(
            value: 'O',
            groupValue: _golonganDarah,
            onChanged: (String? value) {
              setState(() {
                _golonganDarah = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
