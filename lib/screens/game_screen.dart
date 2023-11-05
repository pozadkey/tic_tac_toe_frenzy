import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';
import '../resources/socket_methods.dart';
import '../views/scoreboard.dart';
import '../views/tictactoe_board.dart';
import '../views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game'; // Game screen route
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreeenState();
}

class _GameScreeenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    // Room data
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Scoreboard(),
                  const SizedBox(
                    height: 20,
                  ), // Game scoreboard
                  const TicTacToeBoard(), // Game X or O board
                  // Next player's turn
                  Text(
                    '${roomDataProvider.roomData['turn']['username']}\'s turn',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 142, 255, 67),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
    );
  }
}
