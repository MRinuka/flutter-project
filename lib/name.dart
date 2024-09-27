import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class name extends StatelessWidget {
  final String txt;


  const name({
    super.key, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 15,
      ),
    );
  }
}