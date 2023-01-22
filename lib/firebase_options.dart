import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDl01O__8q5jQjEsxDU3GVrhs3xs0eHVv0',
    appId: '1:209801609379:web:14004fa90a4608c1313f16',
    messagingSenderId: '209801609379',
    projectId: 'switch-app-b6c33',
    authDomain: 'switch-app-b6c33.firebaseapp.com',
    storageBucket: 'switch-app-b6c33.appspot.com',
    measurementId: 'G-FM5MJRL6QR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLRFvRT9PeXO-5hv2fXTc-Yukb5Wjwhd8',
    appId: '1:209801609379:android:030b881a5dcfa0bd313f16',
    messagingSenderId: '209801609379',
    projectId: 'switch-app-b6c33',
    storageBucket: 'switch-app-b6c33.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPSgliMgw24eR3ZV_VIkxT57ZoZh5_3fM',
    appId: '1:209801609379:ios:36387de2780655f5313f16',
    messagingSenderId: '209801609379',
    projectId: 'switch-app-b6c33',
    storageBucket: 'switch-app-b6c33.appspot.com',
    iosClientId: '209801609379-ds5iiadn4v01atr6lc7i2ok59ha714ue.apps.googleusercontent.com',
    iosBundleId: 'com.technomasr.switchapp',
  );
}