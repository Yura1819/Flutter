import 'package:flutter/material.dart'; 
import 'package:my_project/carstat/login_register/login_children.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: loginWidgets(context),
            ),
          ),
        ),
      ),
    );
  }
}
