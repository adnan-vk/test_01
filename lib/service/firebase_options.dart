// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyC0BoUhi9mrS1rnGRVZteQAdK4E-rNrG1M',
    appId: '1:976719476965:web:6e0bb4912c89f97e457c0c',
    messagingSenderId: '976719476965',
    projectId: 'test-ea8d0',
    authDomain: 'test-ea8d0.firebaseapp.com',
    storageBucket: 'test-ea8d0.appspot.com',
    measurementId: 'G-DMQ4NL2F3B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDp-xJufquS_pd0i6GWJgB0-Ct5z3XMr-k',
    appId: '1:976719476965:android:05b6bf16d0246a6b457c0c',
    messagingSenderId: '976719476965',
    projectId: 'test-ea8d0',
    storageBucket: 'test-ea8d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZR-v4rOAeOalSl4sUtIGkJNfgW8wVtT4',
    appId: '1:976719476965:ios:2a22d11fc2319330457c0c',
    messagingSenderId: '976719476965',
    projectId: 'test-ea8d0',
    storageBucket: 'test-ea8d0.appspot.com',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZR-v4rOAeOalSl4sUtIGkJNfgW8wVtT4',
    appId: '1:976719476965:ios:5c1d93e81a189f61457c0c',
    messagingSenderId: '976719476965',
    projectId: 'test-ea8d0',
    storageBucket: 'test-ea8d0.appspot.com',
    iosBundleId: 'com.example.task.RunnerTests',
  );
}