import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/cart_screen.dart';
import 'package:flutter_chess_game/screens/matchmaking_screen.dart';
import 'package:flutter_chess_game/screens/ai_difficulty_selection_screen.dart';
import 'package:flutter_chess_game/screens/options_screen.dart';
import 'package:flutter_chess_game/screens/stats_screen.dart';
import 'package:flutter_chess_game/screens/wallet_screen.dart';
import 'user_account_screen.dart';


class HomeScreen extends StatelessWidget {
  void _navigateToMultiplayerLobby(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchmakingScreen()),
    );
  }

  void _navigateToAIDifficultySelection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AIDifficultySelectionScreen()),
    );
  }

  void _logout(BuildContext context) {
    // Clear user session or perform any other necessary logout operations

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OptionsScreen()),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _navigateToWallet(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WalletScreen()),
    );
  }

  void _navigateToCart(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  }

  void _navigateToStats(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StatsScreen()),
    );
  }

  void _navigateToAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserAccountScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar color to dark theme
        title: null, // Hide the title
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          // Increase the padding to create a 3-tab distance
          color: Colors.black.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _navigateToMultiplayerLobby(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // Customize the button color here
                  padding: EdgeInsets.symmetric(
                      horizontal: 32.0), // Add padding to the button
                ),
                child: Text(
                  'Play Online',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _navigateToAIDifficultySelection(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // Customize the button color here
                  padding: EdgeInsets.symmetric(
                      horizontal: 32.0), // Add padding to the button
                ),
                child: Text(
                  'Play with Friend',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _navigateToAIDifficultySelection(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // Customize the button color here
                  padding: EdgeInsets.symmetric(
                      horizontal: 32.0), // Add padding to the button
                ),
                child: Text(
                  'AI Opponent',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.grey, // Set the selected item color
        unselectedItemColor: Colors.grey, // Set the unselected item color
        showSelectedLabels: false, // Hide labels for selected items
        showUnselectedLabels: false, // Hide labels for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              _navigateToHome(context);
              break;
            case 1:
              _navigateToWallet(context);
              break;
            case 2:
              _navigateToCart(context);
              break;
            case 3:
              _navigateToStats(context);
              break;
            case 4:
              _navigateToAccount(context);
              break;
          }
        },
      ),
    );
  }
}


