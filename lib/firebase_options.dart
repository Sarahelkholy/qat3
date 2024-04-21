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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA926WbXOIMdD8eS6PH_Jh-lYJrCHvpV14',
    appId: '1:286016935556:android:efa57b4d7895283695d4d1',
    messagingSenderId: '286016935556',
    projectId: 'ecommerceapp-a6ef6',
    storageBucket: 'ecommerceapp-a6ef6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsvIG4_FrXMy9sYPj2XHEe-DDY0bJrrRM',
    appId: '1:286016935556:ios:544d70d0cf44a16895d4d1',
    messagingSenderId: '286016935556',
    projectId: 'ecommerceapp-a6ef6',
    storageBucket: 'ecommerceapp-a6ef6.appspot.com',
    androidClientId: '286016935556-oc4dkihrt0ba9mem03ru548oaoknuq95.apps.googleusercontent.com',
    iosClientId: '286016935556-hj59fumkapuv7cgcimk1h9eva3ftfgbp.apps.googleusercontent.com',
    iosBundleId: 'com.example.qat3',
  );

}