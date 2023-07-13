import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess_game/bloc/cubits/game_cubit.dart';
import 'package:flutter_chess_game/bloc/states/game_state.dart';
import 'package:flutter_chess_game/config/colors.dart';
import 'package:flutter_chess_game/ui/board_widget.dart';
import 'package:flutter_chess_game/ui/lost_figures_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_chess_game/screens/victory_popup.dart';
import 'package:flutter_chess_game/screens/defeat_popup.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  void _gameOver(bool isVictory) {
    String username = 'Player 1'; // Replace with actual username
    Color textColor = Colors.white; // Customize the text color
    double fontSize = 24.0; // Customize the font size

    if (isVictory) {
      String rewardsMessage = 'Congratulations! You earned 100 coins'; // Customize the rewards message

      showDialog(
        context: context,
        builder: (context) => VictoryScreen(
          username: username,
          textColor: textColor,
          rewardsMessage: rewardsMessage,
          fontSize: fontSize,
        ),
      );
    } else {
      String message = 'Better luck next time'; // Customize the message

      showDialog(
        context: context,
        builder: (context) => DefeatScreen(
          username: username,
          textColor: textColor,
          message: message,
          fontSize: fontSize,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Set the background color to black

      body: Stack(
        children: [
          BlocBuilder<GameCubit, GameState>(
            bloc: GetIt.I<GameCubit>(),
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LostFiguresWidget(figures: state.board.blackLost.figures),
                  SizedBox(height: 16), // Add spacing between widgets
                  Center(
                    child: Container(
                      width: 450, // Set the desired width of the chessboard
                      height: 400, // Set the desired height of the chessboard
                      child: BoardWidget(
                        availablePositionsHash: state.availablePositionsHash,
                        board: state.board,
                        selectedCell: state.selectedCell,
                      ),
                    ),
                  ),
                  LostFiguresWidget(figures: state.board.whiteLost.figures),
                ],
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black26,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      // Handle home button click
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.undo_sharp),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.redo),
                    onPressed: () {
                      // Handle redo button click
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}