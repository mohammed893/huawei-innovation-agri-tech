import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  // Initialize the Socket.io connection
  void initializeSocket() {
    socket = IO.io(
      'http://localhost:3001', // Replace with your server URL
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket for better performance
          .build(),
    );

    // Event handlers for socket connection
    socket.on('connect', (_) {
      print('Connected to the socket server');
    });

    socket.on('logout', (data) {
      print('Logout: $data');
      // Handle logout or token validation failure
    });

    socket.on('disconnect', (_) {
      print('Disconnected from the server');
    });
  }

  // Connect to the socket server
  void connect() {
    if (!socket.connected) {
      socket.connect();
    }
  }

  // Emit user data for authentication
  void authenticateUser(int userId, String userType, String token) {
    final data = {
      'id': userId,
      'type': userType,
      'token': token,
    };

    socket.emit('user_id', data);
  }

  // Disconnect from the socket server
  void disconnect() {
    socket.disconnect();
    print('Disconnected from the server');
  }
}