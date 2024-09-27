import 'package:artemvita/cart.dart';
import 'package:artemvita/cart_confirmation.dart';
import 'package:artemvita/confirm.dart';
import 'package:flutter/material.dart';

import 'ProfilePage.dart';
import 'home.dart';
import 'paintings.dart';

class Productview extends StatelessWidget {
  static final String id = 'Productview';
  final VoidCallback toggleTheme;

  const Productview({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product View',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfilePage.id);
            },
            icon: Icon(Icons.supervised_user_circle_outlined),
          )
        ],
        flexibleSpace: Stack(
          children: [
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
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/painting.jpg',
              height: 600.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Flower Orchard',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'By L.S Kennedy',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'USD 350',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Abstract painting of an orchard of flowers',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: MaterialButton(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      color: Colors.blueGrey,
                      child: Text(
                        'Buy',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Confirm.id);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: MaterialButton(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      color: Theme.of(context).colorScheme.primary, // Use theme color for button
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.white), // Ensure text is white
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, cart_confirmation.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text('Paintings'),
            onTap: () {
              Navigator.pushNamed(context, PaintingsScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () {
              Navigator.pushNamed(context, cart.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, ProfilePage.id);
            },
          ),
        ],
      ),
    );
  }
}
