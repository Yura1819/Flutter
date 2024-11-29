import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const TextArea({
    required this.hintText, 
    super.key, 
    this.obscureText = false, 
    this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller, 

      obscureText: obscureText, 

      decoration: InputDecoration(
        
        hintText: hintText, 

        fillColor: Colors.deepPurple[50], 

        filled: true, 

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(15), 
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(15), 
        ),
      ),
    );
  }
}
