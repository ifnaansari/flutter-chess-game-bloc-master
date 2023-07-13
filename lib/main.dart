import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_chess_game/bloc/app_blocs.dart';
import 'package:flutter_chess_game/screens/game_screen.dart';
import 'package:flutter_chess_game/screens/splash_screen.dart';
import 'package:flutter_chess_game/screens/options_screen.dart';
import 'package:flutter_chess_game/screens/signin_signup_screen.dart';
import 'package:flutter_chess_game/screens/home_screen.dart';
import 'package:flutter_chess_game/screens/ai_difficulty_selection_screen.dart';
import 'package:flutter_chess_game/screens/matchmaking_screen.dart';
import 'package:flutter_chess_game/screens/opponent_found_screen.dart';
import 'package:flutter_chess_game/screens/user_account_screen.dart';
import 'package:flutter_chess_game/screens/wallet_screen.dart';

void main() {
  createAppBlocs();
  runApp(KnightlyApp());
}

class KnightlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Knightly App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/options': (context) => OptionsScreen(),
        '/signin_signup': (context) => SigninSignupScreen(),
        '/home': (context) => HomeScreen(),
        '/ai_difficulty_selection': (context) => AIDifficultySelectionScreen(),
        '/game': (context) => GameScreen(),
        '/matchmaking': (context) => MatchmakingScreen(),
        '/opponent_found': (context) => OpponentFoundScreen(
          userAvatar: '',
          opponentAvatar: '',
          username: '',
          searching: false,
        ),
        '/userAccount': (context) => UserAccountScreen(),
        '/wallet': (context) => WalletScreen(),
      },
    );
  }
}
