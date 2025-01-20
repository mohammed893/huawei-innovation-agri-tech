import 'package:agritech/api/firebase_api.dart';
import 'package:agritech/socket_service.dart';
import 'package:agritech/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseAPI().initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Socket.io',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SocketScreen(),
    );
  }
}

class SocketScreen extends StatefulWidget {
  @override
  _SocketScreenState createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  final SocketService _socketService = SocketService();

  @override
  void initState() {
    super.initState();
    // Initialize the socket connection before calling connect
    _socketService.initializeSocket(); // Make sure the socket is initialized
    _socketService.connect(); // Now you can safely call connect
  }

  @override
  void dispose() {
    _socketService.disconnect(); // Disconnect when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socket.io in Flutter'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Example usage: Authenticate user with dummy data
            _socketService.authenticateUser(
              1,
              'p', // Example user type
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzM2MzAwNDk2LCJleHAiOjE3MzYzMDQwOTZ9.g8kw8FnuGO45oTq9KRUuNI02HD8z-hLMAKMXY0-fLQI', // Example token
            );
          },
          child: Text('Authenticate User'),
        ),
      ),
    );
  }
}