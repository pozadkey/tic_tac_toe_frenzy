import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game'; // Game screen route
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreeenState();
}

class _GameScreeenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    // Room data

    return Scaffold(
      body: Text(Provider.of<RoomDataProvider>(context).roomData.toString()),
    );
  }
}
