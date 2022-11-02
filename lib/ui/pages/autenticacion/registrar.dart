import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Icons.dart';
import 'package:pegi/ui/widgets/Input.dart';

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlContrasena = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('assets/images/home.png'),
                      fit: BoxFit.cover)),
            )),
        Positioned(
            top: 25,
            left: 20,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: AppIcon(
                      iconD: Icons.arrow_back_ios,
                      iconColor: const Color.fromARGB(255, 202, 209, 209)),
                  onPressed: () {
                    Get.offAllNamed('/principal');
                  },
                )
              ],
            )),
        Positioned(
            top: 100,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registrar',
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
            top: 200,
            height: 750,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 30, top: 30, right: 30, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Input(
                      false,
                      controlNombre,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Input(
                      false,
                      controlApellido,
                      "Apellido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Input(
                      false,
                      controlCorreo,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Input(
                      false,
                      controlContrasena,
                      "Contraseña",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed('/dashboard');
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
}
