import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/opponent_found_screen.dart';

class MatchmakingScreen extends StatefulWidget {
  @override
  _MatchmakingScreenState createState() => _MatchmakingScreenState();
}

class _MatchmakingScreenState extends State<MatchmakingScreen> {
  bool _isSearching = false;
  int? _selectedTimeLimit; // Make the time limit nullable

  void _startMatchmaking() {
    setState(() {
      _isSearching = true;
    });

    // Simulate matchmaking logic
    // Once a suitable opponent is found or connection is established,
    // navigate to the Opponent Found Screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OpponentFoundScreen(
            userAvatar: 'assets/user_avatar.png',
            opponentAvatar: 'assets/opponent_avatar.png',
            username: 'Player 1',
            searching: false,
          ),
        ),
      );
    });
  }

  void _selectTimeLimit(int? value) {
    setState(() {
      _selectedTimeLimit = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar color to dark theme
        title: null, // Hide the title
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Time Limit:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                    value: 1,
                    groupValue: _selectedTimeLimit,
                    onChanged: _selectTimeLimit,
                  ),
                  Text(
                    '1 Minute',
                    style: TextStyle(color: Colors.white),
                  ),
                  Radio<int>(
                    value: 5,
                    groupValue: _selectedTimeLimit,
                    onChanged: _selectTimeLimit,
                  ),
                  Text(
                    '5 Minutes',
                    style: TextStyle(color: Colors.white),
                  ),
                  Radio<int>(
                    value: 10,
                    groupValue: _selectedTimeLimit,
                    onChanged: _selectTimeLimit,
                  ),
                  Text(
                    '10 Minutes',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _startMatchmaking,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // Customize the button color here
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the button
                ),
                child: Text(
                  'Start Searching',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
