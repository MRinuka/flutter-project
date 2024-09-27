import 'package:artemvita/login.dart';
import 'package:artemvita/passwordfield.dart';
import 'package:artemvita/textfield.dart';
import 'package:artemvita/navelement.dart';
import 'package:artemvita/paintings.dart';
import 'package:artemvita/cart.dart';
import 'package:artemvita/home.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  static final String id = "signup";
  final VoidCallback toggleTheme;

  const signup({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Stack(
          children: <Widget>[
            Image.asset(
              'images/navbar.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
        ],
      ),
      drawer: _buildDrawer(context),

      body: Container(
        color: isDarkMode ? Colors.black : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    textfield(label: "Username"),
                    SizedBox(height: 24),
                    passwordfield(label: "Password"),
                    SizedBox(height: 24),
                    passwordfield(label: "Confirm Password"),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Home.id);
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {

                  Navigator.pushNamed(context, login.id);
                },
                child: Text(
                  "Already have an account? Login here",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, Home.id);
            },
          ),
          navelement(
            iconData: Icons.add_a_photo,
            title: 'Paintings',
            route: PaintingsScreen.id,
          ),
          navelement(
            iconData: Icons.shopping_cart,
            title: 'Cart',
            route: cart.id,
          ),
        ],
      ),
    );
  }
}
