import 'package:artemvita/dashboard.dart';
import 'package:artemvita/plist.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static final String id = 'profile';
  final VoidCallback toggleTheme;

  const ProfilePage({super.key, required this.toggleTheme});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isPortrait) {

            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileHeader(constraints),
                  _buildMenuItems(),
                ],
              ),
            );
          } else {

            return Row(
              children: [
                Expanded(child: _buildProfileHeader(constraints)),
                Expanded(child: _buildMenuItems()),
              ],
            );
          }
        },
      ),
    );
  }


  Widget _buildProfileHeader(BoxConstraints constraints) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blueGrey,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/AvatarMaker.png'),
          ),
          SizedBox(height: 16),
          Text(
            'Minuka Risith',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'minukar6@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildMenuItems() {
    return Column(
      children: [
        Divider(),
        plist(icon: Icons.settings, txt: "Settings", route: ''),
        Divider(),
        plist(icon: Icons.history, txt: "Order History", route: ''),
        Divider(),
        plist(icon: Icons.dashboard_customize, txt: 'Product Dashboard', route: dashboard.id),
        Divider(),
        plist(icon: Icons.logout, txt: "Logout", route: ''),
      ],
    );
  }
}
