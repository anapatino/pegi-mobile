import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:get/get.dart';
import '../models/usuario.dart';

class ControlUsuario extends GetxController {
  final Rx<dynamic> _usuarior = "Sin Registro".obs;
  static final Rx<dynamic> _uid = "".obs;
  static final Rx<dynamic> _mensajes = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;

  Future<void> enviarDatos(String user, String contrasena) async {
    UserCredential usuario =
        await PeticionesUsuario.iniciarSesion(user, contrasena);
    _uid.value = usuario.user!.uid;
    _usuarior.value = usuario.user!.email;
  }

  Future<void> RegistrarDatos(String user, String contrasena) async {
    UserCredential usuario =
        await PeticionesUsuario.registrar(user, contrasena);
    _uid.value = usuario.user!.uid;
    _usuarior.value = usuario.user!.email;
  }
}
