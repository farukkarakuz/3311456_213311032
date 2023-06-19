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
    apiKey: 'AIzaSyB9NW2b_uBTdKclYvtCFFCpFtpm_2UtO48',
    appId: '1:348082161654:web:81b770b8e68ec1d07469d7',
    messagingSenderId: '348082161654',
    projectId: 'fruk-4029e',
    authDomain: 'fruk-4029e.firebaseapp.com',
    storageBucket: 'fruk-4029e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQ3GUk3WyjEm3xmoSyVH73QPYp5pyrE24',
    appId: '1:348082161654:android:acc14f3323d44c887469d7',
    messagingSenderId: '348082161654',
    projectId: 'fruk-4029e',
    storageBucket: 'fruk-4029e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuc6qzy2T9gceL2Mn92kY29o8Yi67Y_3M',
    appId: '1:348082161654:ios:52dfdc364e55a4627469d7',
    messagingSenderId: '348082161654',
    projectId: 'fruk-4029e',
    storageBucket: 'fruk-4029e.appspot.com',
    iosClientId: '348082161654-l79jr23hjuuvu6svkf2g99l6l5q62974.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruk',
  );
}