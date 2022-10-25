import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          Positioned(
              left: 0,
              right: 0,
              top: 400,
              height: 750,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 40, top: 30, right: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Bienvenido',
                        style: GoogleFonts.kodchasan(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                          'Asombroso cómo este sistema de desarrollo te permite gestionar tu academia online desde la comodidad de tu hogar.',
                          style: GoogleFonts.kodchasan(
                            color: Colors.black,
                            fontSize: 13,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
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
                            minimumSize: const Size(100, 50),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Registrarse",
                              style: GoogleFonts.kodchasan(
                                color: Colors.black,
                                fontSize: 13,
                              )),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              minimumSize: const Size(80, 50)),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
