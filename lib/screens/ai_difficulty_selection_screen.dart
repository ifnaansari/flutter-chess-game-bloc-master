import 'package:flutter/material.dart';
import 'package:flutter_chess_game/screens/game_screen.dart';
import 'package:flutter_chess_game/screens/stats_screen.dart';
import 'package:flutter_chess_game/screens/user_account_screen.dart';
import 'package:flutter_chess_game/screens/wallet_screen.dart';
import 'package:flutter_chess_game/screens/cart_screen.dart';
import 'package:flutter_chess_game/screens/home_screen.dart';


class AIDifficultySelectionScreen extends StatelessWidget {

  void _navigateToGameScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
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
      MaterialPageRoute(builder: (context) => const UserAccountScreen()),
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
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 32.0, // Adjust the width here
            padding: EdgeInsets.all(16.0),
            child: Card(
              color: Colors.black.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => _navigateToGameScreen(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black26, // Customize the button color here
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the button
                      ),
                      child: Text(
                        'Easy',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () => _navigateToGameScreen(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black26, // Customize the button color here
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the button
                      ),
                      child: Text(
                        'Medium',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () => _navigateToGameScreen(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black26, // Customize the button color here
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the button
                      ),
                      child: Text(
                        'Difficult',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => _navigateToGameScreen(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent, // Customize the button color here
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the button
                      ),
                      child: Text(
                        'Play',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
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
