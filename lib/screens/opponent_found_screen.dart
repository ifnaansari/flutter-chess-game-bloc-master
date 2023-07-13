import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/game_screen.dart';

class OpponentFoundScreen extends StatelessWidget {
  final String userAvatar;
  final String opponentAvatar;
  final String username;
  final bool searching;

  OpponentFoundScreen({
    required this.userAvatar,
    required this.opponentAvatar,
    required this.username,
    required this.searching,
  });

  void _startGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
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
                  Image.asset(
                    'assets/users_avatar.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'vs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Image.asset(
                    'assets/opponents_avatar.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  if (searching)
                    CircularProgressIndicator(),
                  if (!searching)
                    ElevatedButton(
                      onPressed: () => _startGame(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent, // Customize the button color here
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the button
                      ),
                      child: Text(
                        'Start Game',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
