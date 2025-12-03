import 'package:flutter/material.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  int currentIndex = 0;
  List<Color> colors = [Colors.red, Colors.black, Colors.blueAccent];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = (currentIndex + 1) % colors.length;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: colors[currentIndex],
          ),
        ),
      ),
    );
  }
}
