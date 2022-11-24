import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/usuario.dart';
import 'package:pegi/ui/pages/home.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Icons.dart';
import 'package:pegi/ui/widgets/Input.dart';

class Ingresar extends StatefulWidget {
  const Ingresar({super.key});

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  TextEditingController controlUsuario = TextEditingController();
  TextEditingController controlContrasena = TextEditingController();
  ControlUsuario controlu = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensiones.height70,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/home.png'),
                      fit: BoxFit.cover)),
            )),
        Positioned(
            top: Dimensiones.height5,
            left: Dimensiones.width5,
            child: IconButton(
              icon: AppIcon(
                  iconD: Icons.arrow_back_ios,
                  iconColor: const Color.fromARGB(255, 202, 209, 209)),
              onPressed: () {
                Get.offAllNamed('/principal');
              },
            )),
        Positioned(
            top: Dimensiones.height15,
            left: Dimensiones.width15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingresar',
                  style: GoogleFonts.kodchasan(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Ingrese sus datos para continuar',
                  style: GoogleFonts.kodchasan(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
        Positioned(
            left: 0,
            right: 0,
            top: Dimensiones.height30,
            height: Dimensiones.height80,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensiones.width10,
                  vertical: Dimensiones.height5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Input(
                      false,
                      controlUsuario,
                      "Usuario",
                      const EdgeInsets.all(0),
                      EdgeInsets.symmetric(vertical: Dimensiones.height5),
                      const Color.fromARGB(255, 197, 197, 197),
                      Colors.grey.shade700),
                  Input(
                    true,
                    controlContrasena,
                    "Contraseña",
                    const EdgeInsets.all(0),
                    const EdgeInsets.only(bottom: 8),
                    const Color.fromARGB(255, 197, 197, 197),
                    Colors.grey.shade700,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        child: Text(
                          '¿No tiene una cuenta?',
                          style: GoogleFonts.kodchasan(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () => Get.offAllNamed('/registrar')),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensiones.height5),
                    child: ElevatedButton(
                      onPressed: () {
                        controlu
                            .enviarDatos(
                                controlUsuario.text, controlContrasena.text)
                            .then((value) {
                          if (controlu.emailf != 'Sin Registro') {
                            log(controlu.rol + "gola");

                            if (controlu.rol != "") {
                              Get.offAll(HomePage(rol: controlu.rol));
                            }
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'Datos Invalidos',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }).catchError((e) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: 'Datos Invalidos',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        });
                      },
                      child: Text("Ingresar",
                          style: GoogleFonts.kodchasan(
                            color: Colors.white,
                            fontSize: 13,
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(400, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }

  ValidarUsuario(BuildContext context, TextEditingController controlUsuario,
      TextEditingController controlContra) {
    var rol = EncontrarUsuario(context, controlUsuario, controlContra);
    if (rol != null) {
      Get.offAll(HomePage(rol: rol));
    } else {
      Get.showSnackbar(const GetSnackBar(
        title: 'Validacion de usuario',
        message: 'Los datos ingresados no son correctos',
        icon: Icon(Icons.warning),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ));
    }
    controlUsuario.clear();
    controlContra.clear();
  }

  EncontrarUsuario(BuildContext context, TextEditingController controlUsuario,
      TextEditingController controlContra) {
    String user = controlUsuario.text;
    String password = controlContra.text;
    String findUser;
    if (user.isNotEmpty && password.isNotEmpty) {
      for (var element in listaUsuario) {
        if (element.usuario == user && element.contrasena == password) {
          findUser = element.rol;
          return findUser;
        }
      }
    } else {
      Get.showSnackbar(const GetSnackBar(
        title: 'Mensaje Informativo',
        message: 'No ha ingresado los campos requeridos',
        icon: Icon(Icons.warning),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ));
    }
  }
}
