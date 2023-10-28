import 'package:flutter/material.dart';
import 'package:tic_tac_toe_frenzy/screens/create_room_screen.dart';
import 'package:tic_tac_toe_frenzy/screens/home_screen.dart';
import 'package:tic_tac_toe_frenzy/screens/join_room_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'utils/theme/colors.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env"); // Load the .env file
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          HomeScreen.routeName: (context) =>
              const HomeScreen(), // Home screen route
          JoinRoomScreen.routeName: (context) =>
              const JoinRoomScreen(), // Join room route
          CreateRoomScreen.routeName: (context) =>
              const CreateRoomScreen(), // Create room route
        },
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName);
  }
}
