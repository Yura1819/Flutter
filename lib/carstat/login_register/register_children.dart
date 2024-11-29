
import 'package:flutter/material.dart';
import 'package:my_project/carstat/login_register/button.dart';
import 'package:my_project/carstat/login_register/screen.dart';
import 'package:my_project/carstat/login_register/text.dart';

List<Widget> buildRegistrationWidgets(BuildContext context) {
  ScreenSettings.init(context);

  return [
    Text(
      'Create Account',
      style: TextStyle(
          fontSize: ScreenSettings.fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,),
    ),
    SizedBox(height: ScreenSettings.spacing*2),
    Padding(
      padding: ScreenSettings.padding,
      child: const TextArea(hintText: 'Username'),
    ),
    SizedBox(height: ScreenSettings.spacing * 0.5),
    Padding(
      padding: ScreenSettings.padding,
      child: const TextArea(hintText: 'Email'),
    ),
    SizedBox(height: ScreenSettings.spacing * 0.5),
    Padding(
      padding: ScreenSettings.padding,
      child: const TextArea(hintText: 'Password', obscureText: true),
    ),
    SizedBox(height: ScreenSettings.spacing),
    ButtonWidget(buttonText: 'Register', onPressed: () {}),
    SizedBox(height: ScreenSettings.spacing * 0.5),
    TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        'Already have an account? Login',
        style: TextStyle(
            color: Colors.deepPurple, decoration: TextDecoration.underline,),
      ),
    ),
  ];
}
