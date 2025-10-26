import 'package:flutter/material.dart';
import 'package:flutter_application_1/developer_page.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "student flutter app",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/products': (context) => ProductsPage(),
        '/developer': (context) => DeveloperPage(),
      },
    );
  }
}
