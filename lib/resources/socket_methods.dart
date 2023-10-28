import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_frenzy/utils/utils.dart';

import '../provider/room_data_provider.dart';
import '../screens/game_screen.dart';
import 'socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

// Create  room on socket server
  void createRoom(String username) {
    if (username.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'username': username,
      });
    }
  }

  // Join room on socket server
    void joinRoom(String username, String roomId) {
    if (username.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'username': username,
        'roomId': roomId,
      });
    }
  }

  // Listeners
  // Room created
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  // Room joined
    void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  // Error 
  void errorOccuredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      showSnackBar(context, data);
    });
  }

}
