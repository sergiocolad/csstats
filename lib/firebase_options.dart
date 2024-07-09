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
    apiKey: 'AIzaSyCINa6l-w30ygYai4CwVgW_1kH9WXT52ic',
    appId: '1:281690611861:web:58447d4538245bfbcc7b9c',
    messagingSenderId: '281690611861',
    projectId: 'cs2statsinfo',
    authDomain: 'cs2statsinfo.firebaseapp.com',
    storageBucket: 'cs2statsinfo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWqA2-PSCtfjab6BX1LqEdZfDugeo8OSM',
    appId: '1:281690611861:android:cf7b85eeac26984ecc7b9c',
    messagingSenderId: '281690611861',
    projectId: 'cs2statsinfo',
    storageBucket: 'cs2statsinfo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwmteT6v1dUmMBaRHi27rVYHetaACJoPs',
    appId: '1:281690611861:ios:b75bac9de876a15ccc7b9c',
    messagingSenderId: '281690611861',
    projectId: 'cs2statsinfo',
    storageBucket: 'cs2statsinfo.appspot.com',
    iosBundleId: 'com.example.csstats',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwmteT6v1dUmMBaRHi27rVYHetaACJoPs',
    appId: '1:281690611861:ios:b75bac9de876a15ccc7b9c',
    messagingSenderId: '281690611861',
    projectId: 'cs2statsinfo',
    storageBucket: 'cs2statsinfo.appspot.com',
    iosBundleId: 'com.example.csstats',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCINa6l-w30ygYai4CwVgW_1kH9WXT52ic',
    appId: '1:281690611861:web:5ffcf65446644b4acc7b9c',
    messagingSenderId: '281690611861',
    projectId: 'cs2statsinfo',
    authDomain: 'cs2statsinfo.firebaseapp.com',
    storageBucket: 'cs2statsinfo.appspot.com',
  );
}
