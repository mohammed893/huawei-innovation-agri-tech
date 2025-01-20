import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBGNotifications(RemoteMessage message)async{
  print("title : ${message.notification?.title}");
  print("body : ${message.notification?.body}");
  print("payload : ${message.data}");
  print("hello");

}

class FirebaseAPI{
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications ()async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token : $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBGNotifications);
     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received in foreground: ${message.notification?.title}");
    });
  
  }
}