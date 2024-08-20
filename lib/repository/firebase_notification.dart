import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
  }
}
