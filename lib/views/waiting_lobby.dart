import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_textfield.dart';
import '../provider/room_data_provider.dart';
import '../responsive/responsive.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Waiting for a player to join...'),
            const SizedBox(height: 20),
            CustomTextField(
              controller: roomIdController,
              hintText: '',
              isReadOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
