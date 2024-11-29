import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ButtonWidget({
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;

    final double fontSize = screenWidth < 600 ? 16 : 20;
    final EdgeInsets padding = screenWidth < 600
        ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 40, vertical: 20,);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            screenWidth < 600 ? 18 : 20,
          ),
        ),
        padding: padding,
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
    );
  }
}
