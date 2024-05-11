import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAi46vNFgUaLyhokbPi7IF35I1K1roNJVg",
            authDomain: "social-media-gamer-1afc9.firebaseapp.com",
            projectId: "social-media-gamer-1afc9",
            storageBucket: "social-media-gamer-1afc9.appspot.com",
            messagingSenderId: "141083185911",
            appId: "1:141083185911:web:8fce7a44916f63d307f9f2",
            measurementId: "G-D7FS21P86H"));
  } else {
    await Firebase.initializeApp();
  }
}
