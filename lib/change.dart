import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  const Change({super.key});

  @override
  State<Change> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<Change> {
  int currentIndex = 0;
  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.blueAccent,
    Colors.orange,
    Colors.green,
  ];
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
