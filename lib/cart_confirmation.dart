import 'package:artemvita/ProductView.dart';
import 'package:artemvita/cart.dart';
import 'package:artemvita/home.dart';
import 'package:artemvita/paintings.dart';
import 'package:flutter/material.dart';

class cart_confirmation extends StatelessWidget {
  const cart_confirmation({super.key});
  static final String id = 'cart_confirm';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Confirmation",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            "You have added: ",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            "Flower Orchard",
            style: TextStyle(fontFamily: 'Raleway', fontSize: 18, color: Colors.black),
          ),
          Text(
            "For",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            "USD 350",
            style: TextStyle(fontFamily: 'Raleway', fontSize: 18, color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text("View Cart"),
                  onPressed: () {
                    Navigator.pushNamed(context, cart.id);
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  child: Text("Browse",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                  onPressed: () {
                    Navigator.pushNamed(context, PaintingsScreen.id);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
