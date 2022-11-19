import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pegi/ui/pages/autenticacion/registrar.dart';

class PeticionesUsuario {
  static final FirebaseAuth authf = FirebaseAuth.instance;

  static Future<UserCredential> iniciarSesion(
      String user, String contrasena) async {
    try {
      return await authf.signInWithEmailAndPassword(
          email: user, password: contrasena);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no Existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña Incorrecta');
      }
    }
    return Future.error('Error');
  }

  static Future<UserCredential> registrar(
      String user, String contrasena) async {
    try {
      return await authf.createUserWithEmailAndPassword(
          email: user, password: contrasena);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
    return Future.error('Error');
  }
  // static Future<List<Usuario>> validarUsuario(
  //     String usuario, String contrasena) async {
  //   var url = Uri.parse("");
  //   final respuesta =
  //       await http.post(url, body: {'Usuario': usuario, 'pass': contrasena});
  //   return compute(convertir, respuesta.body);
  // }

  // static List<Usuario> convertir(String respuestaBody) {
  //   final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  //   return pasar.map<Usuario>((json) => Usuario.desdeJson(json)).toList();
  // }
}
