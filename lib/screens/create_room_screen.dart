import 'package:flutter/material.dart';
import 'package:tic_tac_toe_frenzy/components/custom_text.dart';

import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../resources/socket_methods.dart';
import '../responsive/responsive.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room'; // Create room route
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  // Username conroller
  final TextEditingController _usernameController = TextEditingController();

  // Socket methods to listen to data
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Screen size
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
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.05),
              CustomTextField(
                controller: _usernameController,
                hintText: 'Enter username',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                  onTap: () => _socketMethods.createRoom(
                        _usernameController.text,
                      ),
                  text: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}
