import 'package:artemvita/artist.dart';
import 'package:artemvita/button.dart';
import 'package:artemvita/cart.dart';
import 'package:artemvita/confirm.dart';
import 'package:artemvita/login.dart';
import 'package:artemvita/name.dart';
import 'package:artemvita/paintings.dart';
import 'package:artemvita/price.dart';
import 'package:flutter/material.dart';
import 'navelement.dart';
import 'home.dart';

class cart extends StatelessWidget {
  final VoidCallback toggleTheme;
  const cart({super.key, required this.toggleTheme});

  static final String id = 'cart';

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ArtemVita',
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
      body: isPortrait ? _buildPortraitLayout(context) : _buildLandscapeLayout(context),
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/painting.jpg',
            height: 50.0,
            width: 50.0,
          ),
          name(txt: "Flower Orchard"),
          artist(txt: "L. S Kennedy"),
          price(txt: "USD 350"),
          button(txt: 'Buy', bcolor: Colors.blueAccent, tcolor: Colors.white, route: Confirm.id),
          button(txt: "Remove", bcolor: Colors.white, tcolor: Colors.black, route: ''),
        ],
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/painting.jpg',
            height: 100.0,
            width: 100.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name(txt: "Flower Orchard"),
                artist(txt: "L. S Kennedy"),
                price(txt: "USD 350"),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(txt: 'Buy', bcolor: Colors.blueAccent, tcolor: Colors.white, route: Confirm.id),
              SizedBox(height: 8.0),
              button(txt: "Remove", bcolor: Colors.white, tcolor: Colors.black, route: ''),
            ],
          ),
        ],
      ),
    );
  }

  // Build the drawer
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
              Navigator.pop(context);
            },
          ),
          navelement(
            iconData: Icons.add_a_photo,
            title: 'Paintings',
            route: PaintingsScreen.id,
          ),
          navelement(
            iconData: Icons.login,
            title: 'Login Or Sign-Up',
            route: login.id,
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


  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo),
          label: 'Paintings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.login),
          label: 'Login Or Sign-Up',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
      currentIndex: 3,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, Home.id);
            break;
          case 1:
            Navigator.pushNamed(context, PaintingsScreen.id);
            break;
          case 2:
            Navigator.pushNamed(context, login.id);
            break;
          case 3:
            Navigator.pushNamed(context, cart.id);
            break;
        }
      },
    );
  }
}
