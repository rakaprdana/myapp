import 'package:flutter/material.dart';

class MyFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<TextEditingController> controllers;
  final List<String> labels;

  const MyFormWidget({
    required this.formKey,
    required this.controllers,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: List.generate(controllers.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                controller: controllers[index],
                decoration: InputDecoration(
                  labelText: labels[index],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi kolom ${labels[index]}';
                  }
                  return null;
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
