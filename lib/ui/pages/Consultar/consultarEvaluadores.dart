import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/widgets/Filter.dart';
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
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Evaluadores Propuesta'),
            Filter(controlador: controlador, texto: 'Filtrar'),
          ],
        ),
      ),
    );
  }
}
