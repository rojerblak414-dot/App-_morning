import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("seub KeoMaNeeSouk"),
            accountEmail: Text("rojerblak414@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/oak.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("home"),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("products"),
            onTap: () => Navigator.popAndPushNamed(context, '/products'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("developer"),
            onTap: () => Navigator.popAndPushNamed(context, '/developer'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("imageslider"),
            onTap: () => Navigator.popAndPushNamed(context, '/imageslider'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("change"),
            onTap: () => Navigator.popAndPushNamed(context, '/change'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("RestaurantList"),
            onTap: () => Navigator.popAndPushNamed(context, '/RestaurantList'),
          ),
        ],
      ),
    );
  }
}
