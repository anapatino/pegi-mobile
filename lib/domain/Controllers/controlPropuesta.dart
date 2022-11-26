import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/propuesta.dart';

class ControlPropuesta extends GetxController {
  final Rxn<List<Propuesta>> _proyectoFirestore = Rxn<List<Propuesta>>();

  Future<void> consultarPropuestas(email) async {
    _proyectoFirestore.value =
        await PeticionesPropuesta.consultarPropuestas(email);
  }

  List<Propuesta>? get getproyectosGral => _proyectoFirestore.value;

  Future<void> registrarPropuesta(Map<String, dynamic> propuesta, String? file,
      String? pickedFileextencion) async {
    try {
      await PeticionesPropuesta.crearPropuesta(
          propuesta, file, pickedFileextencion);
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
