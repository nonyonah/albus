// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDaNoNyi7aG4LiAA-IimWJ4wyqleTjfH4Y',
    appId: '1:33619678198:web:ae7ce88a51748248116dd7',
    messagingSenderId: '33619678198',
    projectId: 'albus-47539',
    authDomain: 'albus-47539.firebaseapp.com',
    storageBucket: 'albus-47539.firebasestorage.app',
    measurementId: 'G-V5VJ9REWJB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCS9VjyqsTn5uG_zlMSXPi3iIZ779M62zo',
    appId: '1:33619678198:android:685a301bcd4e04e0116dd7',
    messagingSenderId: '33619678198',
    projectId: 'albus-47539',
    storageBucket: 'albus-47539.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMQ2kxsCtzKAezstUKr0l-r5eYQ9IpU6k',
    appId: '1:33619678198:ios:2f08d537954db0a9116dd7',
    messagingSenderId: '33619678198',
    projectId: 'albus-47539',
    storageBucket: 'albus-47539.firebasestorage.app',
    iosBundleId: 'com.albus.app',
  );
}
