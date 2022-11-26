import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Input.dart';

import '../../utils/Dimensiones.dart';
import '../../widgets/Button.dart';
import '../../widgets/Filter.dart';
import '../../widgets/Header.dart';

class RegistrarProyecto extends StatefulWidget {
  const RegistrarProyecto({super.key});

  @override
  State<RegistrarProyecto> createState() => _RegistrarProyectoState();
}

class _RegistrarProyectoState extends State<RegistrarProyecto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Header(icon: Icons.arrow_back_rounded, texto: 'Registrar Proyecto'),
            const SizedBox(height: 5),
            InputDownload(
                texto: "Agregar documento",
                icon: Icons.add_to_photos_outlined,
                color: const Color.fromRGBO(30, 30, 30, 1),
                onPressed: () {}),
            Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      texto: "Cancelar",
                      color: Colors.black,
                      colorTexto: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(width: Dimensiones.screenWidth * 0.02),
                    Button(
                      texto: "Enviar",
                      color: const Color.fromRGBO(91, 59, 183, 1),
                      colorTexto: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
