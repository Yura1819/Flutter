import 'package:flutter/material.dart'; 
import 'package:my_project/carstat/home/bottom_part.dart';
import 'package:my_project/carstat/home/drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Stats Tracker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const CustomDrawer(),
      body: const Center(),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
