import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap});
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: size.width * 0.09,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        // elevation: size.width * 0.01,
        backgroundColor: Color.fromARGB(255, 68, 74, 75), // Replace with Amazon button color
        foregroundColor: Colors.white,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
