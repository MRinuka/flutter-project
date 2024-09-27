import 'package:flutter/material.dart';

class passwordfield extends StatelessWidget {
  final String label;

  const passwordfield({
    super.key, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }
}