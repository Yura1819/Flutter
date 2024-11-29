import 'package:flutter/material.dart'; 
import 'package:my_project/carstat/home/screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double iconSize = ScreenSet.getIconSize(context);

    return BottomAppBar(
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.list, color: Colors.white, size: iconSize),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: iconSize),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
