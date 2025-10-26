import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Home")),
      backgroundColor: Colors.yellow,
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/oak.jpg", width: 100, height: 100),

            Icon(Icons.home, size: 20, color: Colors.teal),
            SizedBox(height: 20),

            Text(
              "welcome to the home page",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "explore products or meed developer ",
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/products');
              },
              child: Text("Go to products"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/developer');
              },
              child: Text("Go to developer"),
            ),
          ],
        ),
      ),
    );
  }
}
