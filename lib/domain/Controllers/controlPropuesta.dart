import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:get/get.dart';

class ControlPropuesta extends GetxController {
  Future<void> registrarPropuesta(Map<String, dynamic> propuesta, file,
      pickedFileBytes, pickedFileName) async {
    try {
      await PeticionesPropuesta.crearPropuesta(
          propuesta, file, pickedFileBytes, pickedFileName);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      // if (e.code == 'user-not-found') {
      //   return Future.error('Usuario no Existe');
      // } else if (e.code == 'wrong-password') {
      //   return Future.error('Contraseña Incorrecta');
      // }
    }
  }
}