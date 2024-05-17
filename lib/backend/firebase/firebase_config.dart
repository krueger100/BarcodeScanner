import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDRIfHHZ8331M1EfYdhdH5eM1JjWOCzlMw",
            authDomain: "package-tracker-a2b2e.firebaseapp.com",
            projectId: "package-tracker-a2b2e",
            storageBucket: "package-tracker-a2b2e.appspot.com",
            messagingSenderId: "950699161774",
            appId: "1:950699161774:web:71ccdf77c46f8e9fb6153f",
            measurementId: "G-MY20H5W0CW"));
  } else {
    await Firebase.initializeApp();
  }
}
