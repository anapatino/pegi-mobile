import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Icons.dart';
import 'package:pegi/ui/widgets/Input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controlName = TextEditingController();
  TextEditingController controLastName = TextEditingController();
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
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
                    Get.offAllNamed('/home');
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
                      controlName,
                      "Nombre",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Input(
                      false,
                      controLastName,
                      "Apellido",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Input(
                      false,
                      controlEmail,
                      "Correo",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Input(
                      false,
                      controlPassword,
                      "Contraseña",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 10, bottom: 20),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {},
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
