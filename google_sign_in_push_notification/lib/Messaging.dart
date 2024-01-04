// messaging.dart
import 'package:firebase_messaging/firebase_messaging.dart';

class Messaging {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Set up notification handlers
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle incoming messages
      print("Message received: ${message.notification?.body}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle when the app is open and the user taps on the notification
      print("Message opened app: ${message.notification?.body}");
    });

    // Get the token
    String? token = await _firebaseMessaging.getToken();
    print("Firebase Token: $token");
  }
}
