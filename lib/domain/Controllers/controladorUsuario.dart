import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:get/get.dart';
import '../models/usuario.dart';

class ControlUsuario extends GetxController {
  final Rx<dynamic> _usuarior = "Sin Registro".obs;
  static final Rx<dynamic> _uid = "".obs;
  static final Rx<dynamic> _rol = "".obs;
  final Rxn<List<UsuarioFirebase>> _listaDocentes =
      Rxn<List<UsuarioFirebase>>();

  static final Rx<dynamic> _mensajes = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;
  String get rol => _rol.value;
  List<UsuarioFirebase>? get getListaDocentes => _listaDocentes.value;

  Future<void> enviarDatos(String user, String contrasena) async {
    try {
      UserCredential usuario =
          await PeticionesUsuario.iniciarSesion(user, contrasena);
      String rolUser = await PeticionesUsuario.obtenerRol(user);
      _rol.value = rolUser;
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      // if (e.code == 'user-not-found') {
      //   return Future.error('Usuario no Existe');
      // } else if (e.code == 'wrong-password') {
      //   return Future.error('Contraseña Incorrecta');
      // }
    }
  }

  Future<void> RegistrarDatos(String user, String contrasena) async {
    try {
      bool checkUser = await PeticionesUsuario.verificacionUser(user);
      if (checkUser) {
        UserCredential usuario =
            await PeticionesUsuario.registrar(user, contrasena);
        _uid.value = usuario.user!.uid;
        _usuarior.value = usuario.user!.email;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
  }

  Future<void> consultarListaDocentes() async {
    _listaDocentes.value = await PeticionesUsuario.obtenerDocentes();
  }
}
