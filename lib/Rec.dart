import 'package:flutter/material.dart';

class Rec extends StatelessWidget {
  final String img;
  final String txt;

  const Rec({
    super.key, required this.img, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(

        children: [
          Image.asset(
            img,
            height: 180.0,
            width: 160.0,
          ),
          Text(
            txt,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),

    );
  }
}