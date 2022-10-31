import 'dart:convert';
import 'package:pegi/domain/models/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesUsuario {
  static Future<List<Usuario>> validarUsuario(
      String usuario, String contrasena) async {
    var url = Uri.parse("");
    final respuesta =
        await http.post(url, body: {'Usuario': usuario, 'pass': contrasena});
    return compute(convertir, respuesta.body);
  }

  static List<Usuario> convertir(String respuestaBody) {
    final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

    return pasar.map<Usuario>((json) => Usuario.desdeJson(json)).toList();
  }
}
