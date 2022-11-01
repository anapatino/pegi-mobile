import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/pages/Consultar/ConsultarPropuestas.dart';

import '../../widgets/Consulta.dart';
import '../../widgets/Input.dart';

class ConsultarEvaluador extends StatefulWidget {
  const ConsultarEvaluador({super.key});

  @override
  State<ConsultarEvaluador> createState() => _ConsultarEvaluadorState();
}

class _ConsultarEvaluadorState extends State<ConsultarEvaluador> {
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_outlined,
                            color: Colors.white)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sunny, color: Colors.white)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications,
                            color: Colors.white))
                  ]),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            Text("Evaluadores Propuesta",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  children: [
                    Text("Filtrar",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Consultar(
                icon: Icons.folder,
                texto: 'Consultar \nPropuesta',
                colorBoton: Color.fromRGBO(18, 180, 122, 1),
                onPressed: () {
                  Get.to(() => Mostrar());
                }),
          ],
        ),
      ),
    );
  }
}
