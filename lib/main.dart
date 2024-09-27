import 'dart:math';

import 'package:artemvita/cart.dart';
import 'package:artemvita/cart_confirmation.dart';
import 'package:artemvita/confirm.dart';
import 'package:artemvita/dashboard.dart';
import 'package:artemvita/login.dart';
import 'package:artemvita/productform.dart';
import 'package:artemvita/signup.dart';
import 'package:flutter/material.dart';
import 'ProductView.dart';
import 'ProfilePage.dart';
import 'home.dart';
import 'paintings.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtemVita',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: login(toggleTheme: toggleTheme),
      routes: {
        Home.id: (context) => Home(toggleTheme: toggleTheme),
        PaintingsScreen.id: (context) => PaintingsScreen(toggleTheme: toggleTheme),
        Productview.id: (context) => Productview(toggleTheme: toggleTheme),
        Confirm.id: (context) => Confirm(),
        cart.id: (context) => cart(toggleTheme: toggleTheme),
        cart_confirmation.id: (context) => cart_confirmation(),
        dashboard.id: (context) => dashboard(toggleTheme: toggleTheme),
        login.id: (context) => login(toggleTheme: toggleTheme),
        ProfilePage.id: (context) => ProfilePage(toggleTheme: toggleTheme), 
        productform.id: (context) => productform(toggleTheme: toggleTheme),
        signup.id: (context) => signup(toggleTheme: toggleTheme)
      },
    );
  }
}
