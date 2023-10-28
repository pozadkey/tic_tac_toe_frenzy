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
}
