import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/proyecto.dart';

import '../../data/services/peticionesProyecto.dart';

class ControlProyecto extends GetxController {
  final Rxn<List<Proyecto>> _proyectoFirestore = Rxn<List<Proyecto>>();
  final Rxn<List<Proyecto>> _proyectoDocenteFirestore = Rxn<List<Proyecto>>();

  Future<void> consultarProyectos(email) async {
    _proyectoFirestore.value =
        await PeticionesProyecto.consultarProyectos(email);
  }

  Future<void> consultarProyectosDocentes(id) async {
    _proyectoDocenteFirestore.value =
        await PeticionesProyecto.consultarProyectoDocente(id);
  }

  List<Proyecto>? get getproyectosGral => _proyectoFirestore.value;
  List<Proyecto>? get getproyectosDocentes => _proyectoDocenteFirestore.value;

  Future<void> registrarProyecto(Map<String, dynamic> proyecto,
      String? pickedFilePath, String? pickedFileextencion) async {
    try {
      await PeticionesProyecto.crearProyecto(
          proyecto, pickedFilePath, pickedFileextencion);
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
