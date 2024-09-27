import 'package:flutter/material.dart';

class price extends StatelessWidget {
  final String txt;

  const price({
    super.key, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontFamily: "Raleway",
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 15,
      ),
    );
  }
}