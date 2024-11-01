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
    apiKey: 'AIzaSyAeQ9XxBLAD0CQzZEsGj41Q4sUmAXu3FA4',
    appId: '1:629084541665:web:7a6167b34e2772b64cdda0',
    messagingSenderId: '629084541665',
    projectId: 'carnava-admin-panel',
    authDomain: 'carnava-admin-panel.firebaseapp.com',
    storageBucket: 'carnava-admin-panel.firebasestorage.app',
    measurementId: 'G-2WRDZQBMCP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAbsQXV7JTX6pPHXb7CLmbGQ1MKjgOiE4',
    appId: '1:629084541665:android:6a5435f84049d9c14cdda0',
    messagingSenderId: '629084541665',
    projectId: 'carnava-admin-panel',
    storageBucket: 'carnava-admin-panel.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyv65OW2YZoII4ZV2JCLC5tdFQ6oUGEfs',
    appId: '1:629084541665:ios:d5ab412e5a3f47de4cdda0',
    messagingSenderId: '629084541665',
    projectId: 'carnava-admin-panel',
    storageBucket: 'carnava-admin-panel.firebasestorage.app',
    iosBundleId: 'com.example.carnavaAdminPanel',
  );
}
