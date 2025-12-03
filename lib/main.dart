import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/change.dart';
import 'package:flutter_application_1/developer_page.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/imageslider.dart';
import 'package:flutter_application_1/product_page.dart';
import 'package:flutter_application_1/restuarant_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        '/imageslider': (context) => ImageSlider(),
        '/RestaurantList': (context) => RestaurantList(),
        '/change': (context) => ChangeColor(),
      },
    );
  }
}
