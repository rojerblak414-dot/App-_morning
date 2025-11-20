import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade50,
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/oak.jpg"),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Welcome to Our Store",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Explore our latest products or connect with our developers.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 40),

            SizedBox(
              width: 200,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/products');
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                label: const Text("View Products"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              height: 45,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/developer');
                },
                icon: const Icon(Icons.code_outlined, color: Colors.teal),
                label: const Text("Meet Developer"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.teal,
                  side: BorderSide(color: Colors.teal.shade400, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              height: 45,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/RestaurantList');
                },
                icon: const Icon(Icons.code_outlined, color: Colors.teal),
                label: const Text("RestaurantList"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.teal,
                  side: BorderSide(color: Colors.teal.shade400, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
