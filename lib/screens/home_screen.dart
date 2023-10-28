import 'package:flutter/material.dart';
import 'package:tic_tac_toe_frenzy/screens/create_room_screen.dart';
import 'package:tic_tac_toe_frenzy/screens/join_room_screen.dart';

import '../components/custom_button.dart';
import '../responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  // Route for Homescreen
  static String routeName = '/main-menu';
  const HomeScreen({Key? key}) : super(key: key);

// Navigate to 'CreateRoom' screen
  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

// Navigate to 'Join Room' screen
  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () => createRoom(context),  // Click to create a room
                text: 'Create Room',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () => joinRoom(context), // Click to join a room
                text: 'Join Room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
