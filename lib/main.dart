import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAk92EFZ_yjwuC-1mAFN7deOr8XNKlByfw",
              authDomain: "pegi-mobile.firebaseapp.com",
              projectId: "pegi-mobile",
              storageBucket: "pegi-mobile.appspot.com",
              messagingSenderId: "13367697059",
              appId: "1:13367697059:web:b4ae6f9d7f1464afed2916"),
        )
      : await Firebase.initializeApp();
  runApp(const App());
}
