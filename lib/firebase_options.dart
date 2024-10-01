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
    apiKey: 'AIzaSyB5H3bUskrUpgTsk52Sg3T0sLJPZWZl-Ek',
    appId: '1:553497908708:web:7e4b9d7d38f7ec905aa3f1',
    messagingSenderId: '553497908708',
    projectId: 'redd-cloud',
    authDomain: 'redd-cloud.firebaseapp.com',
    storageBucket: 'redd-cloud.appspot.com',
    measurementId: 'G-X5BRVBBSDJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoSJnHM88xljH0jgpx5nrBZ_3OVLkpHFQ',
    appId: '1:553497908708:android:af8461f16645f1815aa3f1',
    messagingSenderId: '553497908708',
    projectId: 'redd-cloud',
    storageBucket: 'redd-cloud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUaW-DHwYkBsnPjBEKk1mYbW9fC61fbU8',
    appId: '1:553497908708:ios:f28e017a04ef38b85aa3f1',
    messagingSenderId: '553497908708',
    projectId: 'redd-cloud',
    storageBucket: 'redd-cloud.appspot.com',
    iosBundleId: 'reddtsai.reddslife',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUaW-DHwYkBsnPjBEKk1mYbW9fC61fbU8',
    appId: '1:553497908708:ios:913c420ade2fe29e5aa3f1',
    messagingSenderId: '553497908708',
    projectId: 'redd-cloud',
    storageBucket: 'redd-cloud.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB5H3bUskrUpgTsk52Sg3T0sLJPZWZl-Ek',
    appId: '1:553497908708:web:31854eac5bcb518a5aa3f1',
    messagingSenderId: '553497908708',
    projectId: 'redd-cloud',
    authDomain: 'redd-cloud.firebaseapp.com',
    storageBucket: 'redd-cloud.appspot.com',
    measurementId: 'G-DWWVBFSLR6',
  );
}
