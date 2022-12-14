import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pegi/domain/models/index.dart';
import 'package:pegi/domain/models/proyecto.dart';

class PeticionesProyecto {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static UploadTask? uploadTask;

  static Future<void> crearProyecto(Map<String, dynamic> proyecto, String? file,
      String? pickedFileextencion) async {
    var url = '';
    if (file != null) {
      url = await uploadFile(
          file, proyecto['idProyecto'], uploadTask, pickedFileextencion);
    }

    proyecto['anexos'] = url.toString();

    await _db
        .collection('Proyectos')
        .doc(proyecto['Campo'])
        .set(proyecto)
        .catchError((e) {});
  }

  static Future<dynamic> uploadFile(String? file, idProyecto,
      UploadTask? uploadTask, String? pickedFileextencion) async {
    var r;
    final path = 'anexo/$idProyecto.$pickedFileextencion';
    if (file != null) {
      final ref = FirebaseStorage.instance.ref().child(path);
      log(file.toString());
      uploadTask = ref.putString(file);
      final snaphot = await uploadTask.whenComplete(() {});

      final urlDownload = await snaphot.ref.getDownloadURL();
      r = urlDownload;
      log('Link de descarga: $urlDownload');
    }

    return r;
  }

  static Future<List<Proyecto>> consultarProyectos(email) async {
    List<Proyecto> lista = [];
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idEstudiante'] == email) {
          lista.add(Proyecto(
            titulo: doc.data()['titulo'],
            idEstudiante: doc.data()['idEstudiante'],
            anexos: doc.data()['anexos'],
            estado: doc.data()['estado'],
            calificacion: doc.data()['calificacion'],
            idDocente: doc.data()['idDocente'],
            idProyecto: doc.data()['idProyecto'],
            retroalimentacion: doc.data()['retroalimentacion'],
          ));
        }
      }
    });

    return lista;
  }

  static Future<List<Proyecto>> consultarProyectoDocente(id) async {
    List<Proyecto> lista = [];
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        if (doc.data()['idDocente'] == id) {
          lista.add(Proyecto(
            titulo: doc.data()['titulo'],
            idEstudiante: doc.data()['idEstudiante'],
            anexos: doc.data()['anexos'],
            estado: doc.data()['estado'],
            calificacion: doc.data()['calificacion'],
            idDocente: doc.data()['idDocente'],
            idProyecto: doc.data()['idProyecto'],
            retroalimentacion: doc.data()['retroalimentacion'],
          ));
        }
      }
    });

    return lista;
  }
}
