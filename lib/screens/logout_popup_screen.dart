import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/options_screen.dart';

class LogoutPopupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => OptionsScreen()),
                  (Route<dynamic> route) => false,
            );
          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('No'),
        ),
      ],
    );
  }
}
