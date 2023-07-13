import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/home_screen.dart';

class SigninSignupScreen extends StatefulWidget {
  @override
  SigninSignupScreenState createState() => SigninSignupScreenState();
}

class SigninSignupScreenState extends State<SigninSignupScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isSignup = false;

  void _signIn() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Perform validation
    bool isValid = _validateCredentials(username, password);
    if (!isValid) {
      // Show an error message
      showDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData.dark(), // Use dark theme for the dialog
            child: AlertDialog(
              title: Text('Invalid Credentials'),
              content: Text('Please enter a valid username and password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
      );
      return;
    }

    // Navigate to the home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _signUp() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Perform validation
    bool isValid = _validateCredentials(username, password);
    if (!isValid) {
      // Show an error message
      showDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData.dark(), // Use dark theme for the dialog
            child: AlertDialog(
              title: Text('Invalid Credentials'),
              content: Text('Please enter a valid username and password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
      );
      return;
    }

    // Navigate to the home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  bool _validateCredentials(String username, String password) {
    // Perform validation here
    if (username.isEmpty || password.isEmpty || password.length < 8) {
      return false;
    }
    return true;
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
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.black.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _usernameController,
                style: TextStyle(color: Colors.grey), // Set text color to white
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.grey), // Set label color to white
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _passwordController,
                style: TextStyle(color: Colors.grey), // Set text color to white
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey), // Set label color to white
                ),
                obscureText: true,
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _signIn,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // Customize the button color here
                ),
                child: Text('Sign In', style: TextStyle(color: Colors.white)), // Set text color to white
              ),
              SizedBox(height: 0.0),
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Make the button transparent
                  shadowColor: Colors.transparent, // Hide the button shadow
                  padding: EdgeInsets.zero, // Remove padding
                ),
                child: Text('Sign Up', style: TextStyle(color: Colors.white)), // Set text color to white
              ),
            ],
          ),
        ),
      ),
    );
  }
}
