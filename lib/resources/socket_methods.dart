import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tic_tac_toe_frenzy/utils/utils.dart';

import '../provider/room_data_provider.dart';
import '../screens/game_screen.dart';
import 'game_methods.dart';
import 'socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient; // Get socket client ID

// Create  room on socket server
  void createRoom(String username) {
    if (username.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'username': username,
      });
      print(username);
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

// Keep track of position tapped on the grid
  void tapGrid(int index, String roomId, List<String> displayElements) {
    if (displayElements[index] == '') {
      _socketClient.emit('tap', {
        'index': index,
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
      /*Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);*/
      print(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  // Error
  void errorOccuredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      showSnackBar(context, data);
    });
  }

// Update when players joiin the game
  void updatePlayersStateListener(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false).updatePlayer1(
        playerData[0],
      );
      Provider.of<RoomDataProvider>(context, listen: false).updatePlayer2(
        playerData[1],
      );
    });
  }

  // Update room status
  void updateRoomListener(BuildContext context) {
    _socketClient.on('updateRoom', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }

// Update tapped grid
  void tappedListener(BuildContext context) {
    _socketClient.on('tapped', (data) {
      RoomDataProvider roomDataProvider =
          Provider.of<RoomDataProvider>(context, listen: false);
      roomDataProvider.updateDisplayElements(
        data['index'],
        data['choice'],
      );
      roomDataProvider.updateRoomData(data['room']);
      // Check for game winnner at every tap
      GameMethods().checkWinner(context, _socketClient);
    });
  }
}
