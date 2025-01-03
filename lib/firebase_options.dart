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
    apiKey: 'AIzaSyAExxq4vZ1GG4W4prN5oQaB9WCohpmWkhc',
    appId: '1:544319647428:web:37c3b457b85bbdfb05a391',
    messagingSenderId: '544319647428',
    projectId: 'fir-learning-604fa',
    authDomain: 'fir-learning-604fa.firebaseapp.com',
    storageBucket: 'fir-learning-604fa.firebasestorage.app',
    measurementId: 'G-CLM0840J1H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7BhaeRmaPXrJi99OHt6FmY6k9N3MQiUA',
    appId: '1:544319647428:android:8926a6fff669011605a391',
    messagingSenderId: '544319647428',
    projectId: 'fir-learning-604fa',
    storageBucket: 'fir-learning-604fa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-4zeQcUP-bI1EIEvgHfHSPHICQLIFIKQ',
    appId: '1:544319647428:ios:d31086acf513ace705a391',
    messagingSenderId: '544319647428',
    projectId: 'fir-learning-604fa',
    storageBucket: 'fir-learning-604fa.firebasestorage.app',
    iosBundleId: 'com.example.firebaseLearning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-4zeQcUP-bI1EIEvgHfHSPHICQLIFIKQ',
    appId: '1:544319647428:ios:d31086acf513ace705a391',
    messagingSenderId: '544319647428',
    projectId: 'fir-learning-604fa',
    storageBucket: 'fir-learning-604fa.firebasestorage.app',
    iosBundleId: 'com.example.firebaseLearning',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAExxq4vZ1GG4W4prN5oQaB9WCohpmWkhc',
    appId: '1:544319647428:web:dacad0c6e5ce4bea05a391',
    messagingSenderId: '544319647428',
    projectId: 'fir-learning-604fa',
    authDomain: 'fir-learning-604fa.firebaseapp.com',
    storageBucket: 'fir-learning-604fa.firebasestorage.app',
    measurementId: 'G-2G3PRK9BD2',
  );
}
