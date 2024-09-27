import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class artist extends StatelessWidget {
  final String txt;



  const artist({
    super.key, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "L.S Kennedy",
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 15,
      ),
    );
  }
}
