import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:get/get.dart';

import '../../data/services/peticionesProyecto.dart';

class ControlProyecto extends GetxController {
  Future<void> registrarProyecto(Map<String, dynamic> proyecto, file,
      pickedFileBytes, pickedFileName) async {
    try {
      await PeticionesProyecto.crearProyecto(
          proyecto, file, pickedFileBytes, pickedFileName);
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