import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class plist extends StatelessWidget {
  final IconData icon;
  final String txt;
  final String route;

  const plist({
    super.key, required this.icon, required this.txt, required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(txt),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}