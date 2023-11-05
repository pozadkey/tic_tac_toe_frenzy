import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_frenzy/provider/room_data_provider.dart';
import 'package:tic_tac_toe_frenzy/screens/create_room_screen.dart';
import 'package:tic_tac_toe_frenzy/screens/game_screen.dart';
import 'package:tic_tac_toe_frenzy/screens/home_screen.dart';
import 'package:tic_tac_toe_frenzy/screens/join_room_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'utils/themes/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env"); // Load the .env file
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> RoomDataProvider(),
      child: MaterialApp(
        theme: theme,
          routes: {
            HomeScreen.routeName: (context) =>
                const HomeScreen(), // Home screen route
            JoinRoomScreen.routeName: (context) =>
                const JoinRoomScreen(), // Join room route
            CreateRoomScreen.routeName: (context) =>
                const CreateRoomScreen(), // Create room route
                    GameScreen.routeName: (context) =>
                const GameScreen(), // Game scren route
          },
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName),
    );
  }
}
