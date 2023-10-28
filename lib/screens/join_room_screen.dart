import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';
import '../components/custom_textfield.dart';
import '../resources/socket_methods.dart';
import '../responsive/responsive.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room'; // Join room route
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
                text: 'Join Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _usernameController,
                hintText: 'Enter Username',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _gameIdController,
                hintText: 'Enter Game ID',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onTap: () => _socketMethods.joinRoom(
                  _usernameController.text,
                  _gameIdController.text,
                ),
                text: 'Join',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
