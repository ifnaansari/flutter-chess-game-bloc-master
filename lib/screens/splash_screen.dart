import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/options_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Animation<Color?>? _progressColorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _progressColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.lightBlue,
    ).animate(_animationController);
    _animationController.forward();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OptionsScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding( // Add padding to the progress bar
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/knightly_logo.png',
                width: 600,
                height: 600,
              ),
              SizedBox(height: 16.0), // Add space between the logo and progress bar
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _animationController.value,
                    backgroundColor: Colors.grey,
                    valueColor: _progressColorAnimation as Animation<Color?>?,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
