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
    apiKey: 'AIzaSyAjhCA5p5jgUeyXK_iB46fLa3bM6bgLYv4',
    appId: '1:259059541893:web:df4fc47ffd4db3009186ec',
    messagingSenderId: '259059541893',
    projectId: 'gympass-3c2f8',
    authDomain: 'gympass-3c2f8.firebaseapp.com',
    storageBucket: 'gympass-3c2f8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOKgKwJLwbeck8ojKwkOIRMkD_xqas-t8',
    appId: '1:259059541893:android:64f898470a92dc959186ec',
    messagingSenderId: '259059541893',
    projectId: 'gympass-3c2f8',
    storageBucket: 'gympass-3c2f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS71C5E6qh3GqUSklYA9Li0xRRoX_-mZM',
    appId: '1:259059541893:ios:7ba989ff6569d9949186ec',
    messagingSenderId: '259059541893',
    projectId: 'gympass-3c2f8',
    storageBucket: 'gympass-3c2f8.appspot.com',
    iosClientId:
        '259059541893-kusm89l24taumehib7t7hacjj1sagn34.apps.googleusercontent.com',
    iosBundleId: 'com.example.gymCheck',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS71C5E6qh3GqUSklYA9Li0xRRoX_-mZM',
    appId: '1:259059541893:ios:7ba989ff6569d9949186ec',
    messagingSenderId: '259059541893',
    projectId: 'gympass-3c2f8',
    storageBucket: 'gympass-3c2f8.appspot.com',
    iosClientId:
        '259059541893-kusm89l24taumehib7t7hacjj1sagn34.apps.googleusercontent.com',
    iosBundleId: 'com.example.gymCheck',
  );
}
