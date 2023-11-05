import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/room_data_provider.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

// Player's score style
    const scoreTextStyle = TextStyle(
        fontSize: 32,
        color: Color.fromARGB(255, 142, 255, 67),
        fontWeight: FontWeight.bold);

// Player's name style
    const playerTextStyle = TextStyle(
        fontSize: 24,
        color: Color.fromARGB(255, 194, 194, 194),
        fontWeight: FontWeight.bold);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roomDataProvider.player1.username, style: playerTextStyle),
              Text(roomDataProvider.player1.points.toInt().toString(),
                  style: scoreTextStyle),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roomDataProvider.player2.username, style: playerTextStyle),
              Text(roomDataProvider.player2.points.toInt().toString(),
                  style: scoreTextStyle),
            ],
          ),
        ),
      ],
    );
  }
}
