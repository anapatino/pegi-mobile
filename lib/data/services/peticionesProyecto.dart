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

  static Future<void> crearProyecto(Map<String, dynamic> proyecto, file,
      pickedFileBytes, pickedFileName) async {
    var url = '';
    log(pickedFileName);
    if (file != null || pickedFileName != null) {
      url = await uploadFile(file, proyecto['idProyecto'], uploadTask,
          pickedFileBytes, pickedFileName);
    }

    proyecto['anexos'] = url.toString();

    await _db
        .collection('Proyectos')
        .doc(proyecto['Campo'])
        .set(proyecto)
        .catchError((e) {});
  }

  static Future<dynamic> uploadFile(
      file, idproyecto, uploadTask, pickedFileBytes, pickedFileName) async {
    if (kIsWeb) {
      final path = 'anexo/$idproyecto';
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putData(pickedFileBytes!);
    } else {
      final path = 'anexo/$idproyecto';
      final anexo = File(file!.name);
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(anexo);
    }

    final snaphot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snaphot.ref.getDownloadURL();

    log('Link de descarga: $urlDownload');

    return urlDownload;
  }

  Future<List<Proyecto>> consultarProyectos() async {
    List<Proyecto> lista = [];
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Proyecto(
          titulo: doc.data()['titulo'],
          nombrePersona: doc.data()['nombre persona'],
          documento: doc.data()['documento'],
          estado: doc.data()['estado'],
        ));
      }
    });
    return lista;
  }

  Future<List<Proyecto>> consultarProyecto(String titulo) async {
    List<Proyecto> lista = [];
    await _db.collection("Proyectos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Proyecto(
          titulo: doc.data()['titulo'],
          nombrePersona: doc.data()['nombre persona'],
          documento: doc.data()['documento'],
          estado: doc.data()['estado'],
        ));
        print(doc.data()['titulo']);
      }
    });
    return lista;
  }
}
