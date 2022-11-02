import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 700,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage('assets/images/home.png'),
                        fit: BoxFit.cover)),
              )),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 230),
                child: Text(
                  'Pegi',
                  style: GoogleFonts.kodchasan(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 400,
              height: 300,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 30, top: 30, right: 30, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, bottom: 30),
                          child: Text(
                            'Bienvenido',
                            style: GoogleFonts.kodchasan(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                          'Asombroso cómo este sistema de desarrollo te permite gestionar tu academia online desde la comodidad de tu hogar.',
                          style: GoogleFonts.kodchasan(
                            color: Colors.black,
                            fontSize: 13,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed('/ingresar');
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
                              minimumSize: const Size(140, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed('/registrar');
                            },
                            child: Text("Registrarse",
                                style: GoogleFonts.kodchasan(
                                  color: Colors.black,
                                  fontSize: 13,
                                )),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                        color: Colors.black, width: 1.5)),
                                minimumSize: const Size(140, 50)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
