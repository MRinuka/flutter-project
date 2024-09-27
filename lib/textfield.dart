import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final String label;

  const textfield({
    super.key, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
