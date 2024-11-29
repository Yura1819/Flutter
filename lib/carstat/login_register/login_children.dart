import 'package:flutter/material.dart'; 

import 'package:my_project/carstat/app/home_page.dart'; 

import 'package:my_project/carstat/app/register.dart'; 

import 'package:my_project/carstat/login_register/button.dart'; 

import 'package:my_project/carstat/login_register/screen.dart'; 

import 'package:my_project/carstat/login_register/text.dart'; 

List<Widget> loginWidgets(BuildContext context) {
  
  ScreenSettings.init(context); 

  return [
    FlutterLogo(size: ScreenSettings.logoSize), 
    
    SizedBox(height: ScreenSettings.spacing * 1.5), 

    Text(
      'Welcome Back!',
      style: TextStyle(
        fontSize: ScreenSettings.fontSize, 
        fontWeight: FontWeight.bold, 
        color: Colors.deepPurple,
      ),
    ),
    
    SizedBox(height: ScreenSettings.spacing), 

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

    ButtonWidget(
      buttonText: 'Login',
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute<void>(builder: (context) => const MainPage(),
          ),
        );
      },
    ),

    SizedBox(height: ScreenSettings.spacing * 0.5), 

    TextButton(
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute<void>(builder:(context) => const RegistrationPage(),
          ),
        );
      },
      child: const Text(
        'Don\'t have an account? Register',
        style: TextStyle(
          color: Colors.deepPurple,
          // Колір тексту кнопки — фіолетовий.
          decoration: TextDecoration.underline,
          // Підкреслений текст.
        ),
      ),
    ),
  ];
}
