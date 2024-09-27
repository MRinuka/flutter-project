import 'package:artemvita/ProfilePage.dart';
import 'package:artemvita/paintings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Rec.dart';
import 'cart.dart';
import 'login.dart';
import 'navelement.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.toggleTheme});

  final VoidCallback toggleTheme;

  static final String id = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ArtemVita',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),

          IconButton(onPressed: () {Navigator.pushNamed(context, ProfilePage.id);},
              icon: Icon(Icons.supervised_user_circle_outlined))
        ],
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
      ),
      body: HomeScreen(),
      drawer: Drawer(
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
              title: Text('Home', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            navelement(iconData: Icons.add_a_photo, title: 'Paintings', route: PaintingsScreen.id),
            navelement(iconData: Icons.login, title: 'Login Or Sign-Up', route: login.id),
            navelement(iconData: Icons.shopping_cart, title: 'Cart', route: cart.id),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 0,
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
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'images/hero.jpg',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  'Welcome To ArtemVita',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          color: Colors.black,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'login.id');
            },
            child: Text(
              'New to ArtemVita? Make an account now.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'We offer pieces of Art, brought to you by collectors such as yourself',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: isLandscape ? 24 : 30,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Rec(img: 'images/bg.jpg', txt: ''),
            Rec(img: 'images/texture.png', txt: ''),
            if (isLandscape) Rec(img: 'images/painting.jpg', txt: ''),
          ],
        ),
      ],
    );
  }
}
