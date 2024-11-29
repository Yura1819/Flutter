import 'package:flutter/material.dart';
import 'package:my_project/carstat/app/autologin_page.dart';
import 'package:my_project/carstat/app/home_page.dart';
import 'package:my_project/carstat/app/login.dart';
import 'package:my_project/carstat/app/profile.dart';
import 'package:my_project/carstat/app/register.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carstat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AutologinPage(),
      routes: {
        '/home': (context) => const MainPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegistrationPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
