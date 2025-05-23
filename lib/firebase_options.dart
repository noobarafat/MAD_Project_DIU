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
    apiKey: 'AIzaSyDYVKxGUhdkku2O0XqGSXC70s3qS7VCfMg',
    appId: '1:1060351869540:web:e89ff2d9c5de9624575571',
    messagingSenderId: '1060351869540',
    projectId: 'unievent-364f8',
    authDomain: 'unievent-364f8.firebaseapp.com',
    storageBucket: 'unievent-364f8.firebasestorage.app',
    measurementId: 'G-XGSNV004T0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAr8ZoOLp1hUjlbw5MNlIsGU-cVkGLi44s',
    appId: '1:1060351869540:android:96be8e2a134acf92575571',
    messagingSenderId: '1060351869540',
    projectId: 'unievent-364f8',
    storageBucket: 'unievent-364f8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxsKiMZz5w3e7Ez7aMP_1Lx82JkIYkDbI',
    appId: '1:1060351869540:ios:75f262e216dadf87575571',
    messagingSenderId: '1060351869540',
    projectId: 'unievent-364f8',
    storageBucket: 'unievent-364f8.firebasestorage.app',
    iosBundleId: 'com.example.universityEventManagementSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxsKiMZz5w3e7Ez7aMP_1Lx82JkIYkDbI',
    appId: '1:1060351869540:ios:75f262e216dadf87575571',
    messagingSenderId: '1060351869540',
    projectId: 'unievent-364f8',
    storageBucket: 'unievent-364f8.firebasestorage.app',
    iosBundleId: 'com.example.universityEventManagementSystem',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDYVKxGUhdkku2O0XqGSXC70s3qS7VCfMg',
    appId: '1:1060351869540:web:c415e1ee7283773d575571',
    messagingSenderId: '1060351869540',
    projectId: 'unievent-364f8',
    authDomain: 'unievent-364f8.firebaseapp.com',
    storageBucket: 'unievent-364f8.firebasestorage.app',
    measurementId: 'G-X1CXTTPL2C',
  );
}
