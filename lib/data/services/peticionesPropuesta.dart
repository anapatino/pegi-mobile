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

  static Future<dynamic> cargaranexos(var anexos, var idArt) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Propuesta");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idArt).putFile(anexos);

    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
  }

  static Future<dynamic> uploadFile(
      file, idPropuesta, uploadTask, pickedFileBytes, pickedFileName) async {
    if (kIsWeb) {
      final path = 'anexo/$pickedFileName';
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.child(idPropuesta).putData(pickedFileBytes!);
    } else {
      final path = 'anexo/${file!.name}';
      final anexo = File(file!.name);
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.child(idPropuesta).putFile(anexo);
    }

    final snaphot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snaphot.ref.getDownloadURL();

    log('Link de descarga: $urlDownload');

    Get.showSnackbar(const GetSnackBar(
      message: 'Guardado con exito',
      icon: Icon(Icons.gpp_good_outlined),
      duration: Duration(seconds: 5),
      backgroundColor: Colors.greenAccent,
    ));
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
}
