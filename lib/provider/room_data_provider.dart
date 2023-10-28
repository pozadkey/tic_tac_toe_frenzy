import 'package:flutter/material.dart';

// Notify listeners
class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {}; // Creat private class for room data

  Map<String, dynamic> get roomData => _roomData;

  // Get room data from listener
  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners(); 
  }
}
