import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String txt;
  final Color bcolor;
  final Color tcolor;
  final String route;

  const button({
    super.key, required this.txt, required this.bcolor, required this.tcolor, required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: bcolor,
      child: Text(
        txt,
        style: TextStyle(color: tcolor),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}