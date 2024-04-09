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
    apiKey: 'AIzaSyAkKk0jWrOsSpEVZwGVehnXm2hLEP9kkco',
    appId: '1:97889853694:web:9db5bb98b8b8378a1205af',
    messagingSenderId: '97889853694',
    projectId: 'lawyerapp-aa1ae',
    authDomain: 'lawyerapp-aa1ae.firebaseapp.com',
    storageBucket: 'lawyerapp-aa1ae.appspot.com',
    measurementId: 'G-3ZYHDDHGMT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYh6-3D7E671Dlh-JtV3g2WVcopadDpwM',
    appId: '1:97889853694:android:f37e019c77e3184d1205af',
    messagingSenderId: '97889853694',
    projectId: 'lawyerapp-aa1ae',
    storageBucket: 'lawyerapp-aa1ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUbjX-Ih5JlYFj10Mu593aXZSOajbfDvM',
    appId: '1:97889853694:ios:4e65cd5ee16523741205af',
    messagingSenderId: '97889853694',
    projectId: 'lawyerapp-aa1ae',
    storageBucket: 'lawyerapp-aa1ae.appspot.com',
    androidClientId: '97889853694-ob3bnejrcq31n8rlkr7l821mqvqtdlgq.apps.googleusercontent.com',
    iosClientId: '97889853694-5f32j7omeqfo4m6if92psf89r9nsmvvb.apps.googleusercontent.com',
    iosBundleId: 'com.example.pone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUbjX-Ih5JlYFj10Mu593aXZSOajbfDvM',
    appId: '1:97889853694:ios:6dd7593763a7b51f1205af',
    messagingSenderId: '97889853694',
    projectId: 'lawyerapp-aa1ae',
    storageBucket: 'lawyerapp-aa1ae.appspot.com',
    androidClientId: '97889853694-ob3bnejrcq31n8rlkr7l821mqvqtdlgq.apps.googleusercontent.com',
    iosClientId: '97889853694-rombdogtsutb1pj60tqr3habb1d4bruk.apps.googleusercontent.com',
    iosBundleId: 'com.example.pone.RunnerTests',
  );
}