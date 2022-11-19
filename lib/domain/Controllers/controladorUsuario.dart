import 'package:firebase_auth/firebase_auth.dart';
import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:get/get.dart';
import '../models/usuario.dart';

class ControlUsuario extends GetxController {
  final FirebaseAuth authf = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarior = "Sin Registro".obs;
  final Rx<dynamic> _mensajes = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;

  Future<void> iniciarSesion(final String user, final String contrasena) async {
    try {
      UserCredential usuario = await authf.signInWithEmailAndPassword(
          email: user, password: contrasena);

      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no Existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña Incorrecta');
      }
    }
    // return await FirebaseAuth.instance
    //     .signInWithEmailAndPassword(email: user, password: contrasena);
  }
}
