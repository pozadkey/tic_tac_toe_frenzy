import 'package:flutter/material.dart';

import '../models/player.dart';

// Notify listeners
class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {}; // Create private class for room data
  // List of available positions of gameboard
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0; // Checked for filled grid
  // Player 1 infro
  Player _player1 = Player(
    username: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );

  // Player 2 info
  Player _player2 = Player(
    username: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  Player get player1 => _player1;
  Player get player2 => _player2;
  Map<String, dynamic> get roomData => _roomData;
  List<String> get displayElements => displayElement;
  
  // Get room data from listener
  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  // Update player 1
  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  // Update player 2
  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

// Display updated display element
  void updateDisplayElements(int index, String choice) {
    displayElement[index] = choice;
    filledBoxes += 1;
    notifyListeners();
  }

// Reset grid
    void setFilledBoxesTo0() {
    filledBoxes = 0;
  }
}
