import 'package:flutter/material.dart';
import 'ProductCard.dart';
import 'ProductView.dart';
import 'ProfilePage.dart';
import 'cart.dart';
import 'home.dart';
import 'login.dart';
import 'navelement.dart';

class PaintingsScreen extends StatelessWidget {
  static final String id = "paintings";
  final VoidCallback toggleTheme;

  PaintingsScreen({Key? key, required this.toggleTheme}) : super(key: key);

  final List<Map<String, String>> paintings = [
    {'pic': 'images/painting.jpg', 'title': 'Flower Orchard', 'price': 'USD 750'},
    {'pic': 'images/hero.jpg', 'title': 'Reflection', 'price': 'USD 3000'},
    {'pic': 'images/bg.jpg', 'title': 'Abstract Shapes', 'price': 'USD 3500'},
    {'pic': 'images/wallArt.jpg', 'title': 'Butterfly Wall', 'price': 'USD 4000'},
    {'pic': 'images/texture.png', 'title': 'Flowers in Bloom', 'price': 'USD 4500'},
    {'pic': 'images/lb.jpg', 'title': 'Modern Portrait', 'price': 'USD 5000'},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paintings',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
          IconButton(onPressed: () {Navigator.pushNamed(context, ProfilePage.id);},
              icon: Icon(Icons.supervised_user_circle_outlined))
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
              ),
            ),
            navelement(iconData: Icons.home, title: 'Home', route: Home.id),
            navelement(iconData: Icons.add_a_photo, title: 'Paintings', route: PaintingsScreen.id),
            navelement(iconData: Icons.abc, title: 'Login Or Sign-Up', route: login.id),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isLandscape ? 3 : 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: paintings.length,
          itemBuilder: (context, index) {
            final painting = paintings[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Productview.id);
              },
              child: ProductCard(
                pic: painting['pic']!,
                title: painting['title']!,
                price: painting['price']!,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: 'Paintings'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login Or Sign-Up'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
      ),
    );
  }
}
