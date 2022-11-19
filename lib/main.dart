import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAU4hPmspfzaZ9-7hOeIJSM_1FN3WzFlQE",
          authDomain: "pegi-7ed4c.firebaseapp.com",
          projectId: "pegi-7ed4c",
          storageBucket: "pegi-7ed4c.appspot.com",
          messagingSenderId: "743468186486",
          appId: "1:743468186486:web:5e1c06d140dbf67d139857",
          measurementId: "G-GRQEHTYESB"));
  Get.put(ControlUsuario());

  runApp(const App());
}
