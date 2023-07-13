import 'dart:ui' show Color, FontWeight, ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/wallet_screen.dart';

class VictoryScreen extends StatelessWidget {
  final String username;
  final Color textColor;
  final String rewardsMessage;
  final double fontSize;

  VictoryScreen({
    required this.username,
    required this.textColor,
    required this.rewardsMessage,
    required this.fontSize,
  });

  void _navigateToWallet(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WalletScreen()),
    );
  }

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
                  'You Won!',
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
                TextButton(
                  onPressed: () => _navigateToWallet(context),
                  child: Text(
                    'Check Wallet for Rewards',
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                    ),
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
