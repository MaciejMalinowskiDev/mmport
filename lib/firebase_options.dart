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
    apiKey: 'AIzaSyAOaIlg8Nsafforr46QmEsz-5NHd7E0rH4',
    appId: '1:73465121763:web:23456ce5d589853f01eed6',
    messagingSenderId: '73465121763',
    projectId: 'mmportfb',
    authDomain: 'mmportfb.firebaseapp.com',
    storageBucket: 'mmportfb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbA5Nsl6AF6Vcfy8Q8hVV1w3wwJAdnfrs',
    appId: '1:73465121763:android:dea112a6b76f7bca01eed6',
    messagingSenderId: '73465121763',
    projectId: 'mmportfb',
    storageBucket: 'mmportfb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYjirR-Sc07MbgJycUf_Z3GCLGAPEf0tA',
    appId: '1:73465121763:ios:271b37af3ee117c101eed6',
    messagingSenderId: '73465121763',
    projectId: 'mmportfb',
    storageBucket: 'mmportfb.appspot.com',
    iosBundleId: 'com.maciejmalinowski.mmport',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYjirR-Sc07MbgJycUf_Z3GCLGAPEf0tA',
    appId: '1:73465121763:ios:271b37af3ee117c101eed6',
    messagingSenderId: '73465121763',
    projectId: 'mmportfb',
    storageBucket: 'mmportfb.appspot.com',
    iosBundleId: 'com.maciejmalinowski.mmport',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAOaIlg8Nsafforr46QmEsz-5NHd7E0rH4',
    appId: '1:73465121763:web:da9e05ae6a8f49a401eed6',
    messagingSenderId: '73465121763',
    projectId: 'mmportfb',
    authDomain: 'mmportfb.firebaseapp.com',
    storageBucket: 'mmportfb.appspot.com',
  );

}