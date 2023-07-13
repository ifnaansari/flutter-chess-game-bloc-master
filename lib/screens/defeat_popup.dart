import 'dart:ui';
import 'package:flutter/material.dart';

class DefeatScreen extends StatelessWidget {
  final String username;
  final Color textColor;
  final String message;
  final double fontSize;

  DefeatScreen({
    required this.username,
    required this.textColor,
    required this.message,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set screen background color to dark theme
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Add the blurred game screen as the background
          // You can use BackdropFilter to apply the blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You Lose',
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  username,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  message,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
