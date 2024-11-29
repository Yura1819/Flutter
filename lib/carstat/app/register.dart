import 'package:flutter/material.dart'; 
import 'package:my_project/carstat/login_register/register_children.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildRegistrationWidgets(context),
            ),
          ),
        ),
      ),
    );
  }
}
