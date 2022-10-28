import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Icons.dart';
import 'package:pegi/ui/widgets/Input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlUser = TextEditingController();
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
            top: 200,
            height: 750,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Input(
                      false,
                      controlUser,
                      "Usuario",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(top: 30, bottom: 40),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Input(
                      true,
                      controlPassword,
                      "Contraseña",
                      const EdgeInsets.all(0),
                      const EdgeInsets.only(bottom: 10),
                      Colors.grey.shade700,
                      const Color.fromARGB(255, 197, 197, 197)),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '¿Olvidaste la contraseña?',
                        style: GoogleFonts.kodchasan(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppIcon(
                              iconD: Icons.arrow_right_alt,
                              iconColor: Colors.grey),
                          Text("Continuar con Google",
                              style: GoogleFonts.kodchasan(
                                color: Colors.grey,
                                fontSize: 13,
                              ))
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(
                                color: Colors.grey, width: 0.5)),
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
