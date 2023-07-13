import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<GameDetails> gameDetailsList = [
    GameDetails('Game 1', 'Reward 1', 100),
    GameDetails('Game 2', 'Reward 2', 200),
    GameDetails('Game 3', 'Reward 3', 300),
  ];

  void addGameDetails(GameDetails gameDetails) {
    setState(() {
      gameDetailsList.insert(0, gameDetails);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Wallet',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Games',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Rewards',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Points',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: gameDetailsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      gameDetailsList[index].game,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      gameDetailsList[index].reward,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      '${gameDetailsList[index].points} Points',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameDetails {
  final String game;
  final String reward;
  final int points;

  GameDetails(this.game, this.reward, this.points);
}
