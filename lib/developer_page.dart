import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("developer Info"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.deepOrange,
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/oak.jpg"),
            ),
            SizedBox(height: 20),
            Text(
              ' seub due ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "flutter",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'ຊື່ ສ,ນ ສືບ , ສາຂາຮຽນ It( ພັດທະນາ App)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),

            SizedBox(height: 20),
            Card(
              color: Colors.teal[50],
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text('rojerblank414@gmail.com'),
              ),
            ),
            Card(
              color: Colors.teal[50],
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text('020 94009385'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/products');
              },
              child: Text("comeback to products"),
            ),
          ],
        ),
      ),
    );
  }
}
