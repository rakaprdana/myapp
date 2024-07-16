import 'package:flutter/material.dart';

class RadioWidgetJK extends StatefulWidget {
  @override
  _RadioWidgetJKState createState() => _RadioWidgetJKState();
}

class _RadioWidgetJKState extends State<RadioWidgetJK> {
  String? _jenisKelamin = 'Laki-laki'; // Set default value if needed

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jenis Kelamin'),
        ListTile(
          title: const Text('Laki-laki'),
          leading: Radio<String>(
            value: 'Laki-laki',
            groupValue: _jenisKelamin,
            onChanged: (String? value) {
              setState(() {
                _jenisKelamin = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Perempuan'),
          leading: Radio<String>(
            value: 'Perempuan',
            groupValue: _jenisKelamin,
            onChanged: (String? value) {
              setState(() {
                _jenisKelamin = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
