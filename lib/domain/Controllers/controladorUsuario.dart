import 'package:pegi/data/services/peticionesUsuario.dart';
import 'package:get/get.dart';
import '../models/usuario.dart';

class ControlUsuario extends GetxController {
  final Rxn<List<Usuario>> _users = Rxn<List<Usuario>>();

  List<Usuario>? get user => _users.value;

  Future<void> enviarDatos(String usuario, String contrasena) async {
    _users.value = await PeticionesUsuario.validarUsuario(usuario, contrasena);
  }
}
