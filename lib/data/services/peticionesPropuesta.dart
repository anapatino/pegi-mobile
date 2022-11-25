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
import 'package:pegi/domain/models/propuesta.dart';

class PeticionesPropuesta {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static UploadTask? uploadTask;

  static Future<void> crearPropuesta(Map<String, dynamic> propuesta, file,
      pickedFileBytes, pickedFileName) async {
    var url = '';
    log(pickedFileName);
    if (file != null || pickedFileName != null) {
      url = await uploadFile(file, propuesta['idPropuesta'], uploadTask,
          pickedFileBytes, pickedFileName);
    }

    propuesta['anexos'] = url.toString();

    await _db
        .collection('Propuesta')
        .doc(propuesta['Campo'])
        .set(propuesta)
        .catchError((e) {});
    //return "true";
  }

  // static Future<dynamic> cargaranexos(var anexos, var idArt) async {
  //   final fs.Reference storageReference =
  //       fs.FirebaseStorage.instance.ref().child("Propuesta");

  //   fs.TaskSnapshot taskSnapshot =
  //       await storageReference.child(idArt).putFile(anexos);

  //   var url = await taskSnapshot.ref.getDownloadURL();

  //   return url.toString();
  // }

  static Future<dynamic> uploadFile(
      file, idPropuesta, uploadTask, pickedFileBytes, pickedFileName) async {
    if (kIsWeb) {
      final path = 'anexo/$idPropuesta';
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putData(pickedFileBytes!);
    } else {
      final path = 'anexo/$idPropuesta';
      final anexo = File(file!.name);
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(anexo);
    }

    final snaphot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snaphot.ref.getDownloadURL();

    log('Link de descarga: $urlDownload');

    return urlDownload;
  }

  // static Future<void> actualizarArticulo(
  //     String id, Map<String, dynamic> propuesta) async {
  //   await _db.collection('Articulos').doc(id).update(propuesta).catchError((e) {
  //     log(e);
  //   });
  //   //return true;
  // }

  // static Future<void> eliminarpropuesta(String id) async {
  //   await _db.collection('Articulos').doc(id).delete().catchError((e) {
  //     log(e);
  //   });
  //   //return true;
  // }

  // static Future<List<Propuesta>> consultarGral() async {
  //   List<Propuesta> lista = [];
  //   await _db.collection("Articulos").get().then((respuesta) {
  //     for (var doc in respuesta.docs) {
  //       log(doc.data().toString());
  //       lista.add(Propuesta.desdeDoc(doc.data()));
  //     }
  //   });

  //   return lista;
  // }

  // static Future<List<Propuesta>> consultarG(String id) async {
  //   List<Propuesta> lista = [];
  //   await _db.collection("Usuarios").get().then((respuesta) {
  //     for (var doc in respuesta.docs) {
  //       log(doc.data().toString());
  //       lista.add(Propuesta.desdeDoc(doc.data()));
  //     }
  //   });

  //   return lista;
  // }

  Future<List<Propuesta>> consultarPropuestas() async {
    List<Propuesta> lista = [];
    await _db.collection("Propuesta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Propuesta(
          anexos: doc.data()['anexos'],
          apellido: doc.data()['apellido'],
          apellido2: doc.data()['apellido2'],
          areaTematica: doc.data()['areaTematica'],
          bibliografia: doc.data()['bibliografia'],
          celular: doc.data()['celular'],
          celular2: doc.data()['celular2'],
          correo: doc.data()['correo'],
          correo2: doc.data()['correo2'],
          especificos: doc.data()['especificos'],
          general: doc.data()['general'],
          grupoInvestigacion: doc.data()['grupoInvestigacion'],
          idPropuesta: doc.data()['idPropuesta'],
          identificacion: doc.data()['identificacion'],
          identificacion2: doc.data()['identificacion2'],
          justificacion: doc.data()['justificacion'],
          lineaInvestigacion: doc.data()['lineaInvestigacion'],
          nombre: doc.data()['nombre'],
          nombre2: doc.data()['nombre2'],
          numero: doc.data()['numero'],
          numero2: doc.data()['numero2'],
          planteamiento: doc.data()['plantamiento'],
          programa: doc.data()['programa'],
          programa2: doc.data()['programa2'],
          sublineaInvestigacion: doc.data()['sublineaInvestigacion'],
        ));
        print(doc.data()['areaTematica']);
      }
    });
    return lista;
  }
}