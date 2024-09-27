import 'package:flutter/material.dart';

class navelement extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String route;



  const navelement({
    super.key, required this.iconData, required this.title, required this.route
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}