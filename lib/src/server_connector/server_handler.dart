import 'dart:io';

class ServerHandler {
  late Socket _socket;

  ServerHandler(String address, int port) {
    _initializeConnection(address, port);
  }

  Future<void> _initializeConnection(String address, int port) async {
    try {
      _socket = await Socket.connect(address, port);
      print('Connected to: ${_socket.remoteAddress.address}:${_socket.remotePort}');
    } catch (e) {
      print('Failed to connect: $e');
    }
  }

  void sendMessage(String message) {
    print('Sending: $message');
    _socket.write(message + '\n');  // Ensure to append '\n' to signify end of message
    _socket.flush();  // Ensure that the data is sent immediately
    print("Flushed");
  }

  void disconnect() {
    _socket.close();
  }
}