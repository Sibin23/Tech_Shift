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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyACCJo-tg9-BuQCjpJ3P-Z0dbjFhXH205U',
    appId: '1:137194745088:web:65e033fe16ee4aba7b97e5',
    messagingSenderId: '137194745088',
    projectId: 'tech-shift-7',
    authDomain: 'tech-shift-7.firebaseapp.com',
    storageBucket: 'tech-shift-7.firebasestorage.app',
    measurementId: 'G-CV3BTSJPYP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBq9TrM-ZFi-yH0o5Hh8VYIgb-OG9JYYYE',
    appId: '1:137194745088:android:37a896dbb26a1e037b97e5',
    messagingSenderId: '137194745088',
    projectId: 'tech-shift-7',
    storageBucket: 'tech-shift-7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3B--oSLXjcnwlDouWmcayzIIaaQQUcu0',
    appId: '1:137194745088:ios:9ba2d430f4e632657b97e5',
    messagingSenderId: '137194745088',
    projectId: 'tech-shift-7',
    storageBucket: 'tech-shift-7.firebasestorage.app',
    iosBundleId: 'com.example.techShift',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3B--oSLXjcnwlDouWmcayzIIaaQQUcu0',
    appId: '1:137194745088:ios:9ba2d430f4e632657b97e5',
    messagingSenderId: '137194745088',
    projectId: 'tech-shift-7',
    storageBucket: 'tech-shift-7.firebasestorage.app',
    iosBundleId: 'com.example.techShift',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyACCJo-tg9-BuQCjpJ3P-Z0dbjFhXH205U',
    appId: '1:137194745088:web:90a77bb27c1e9be27b97e5',
    messagingSenderId: '137194745088',
    projectId: 'tech-shift-7',
    authDomain: 'tech-shift-7.firebaseapp.com',
    storageBucket: 'tech-shift-7.firebasestorage.app',
    measurementId: 'G-GRPGZM8SSS',
  );
}
