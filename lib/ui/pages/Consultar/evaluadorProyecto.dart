import 'package:flutter/material.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';

class EvaluadorProyecto extends StatefulWidget {
  const EvaluadorProyecto({super.key});

  @override
  State<EvaluadorProyecto> createState() => _EvaluadorProyectoState();
}

class _EvaluadorProyectoState extends State<EvaluadorProyecto> {
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
                icon: Icons.arrow_back_rounded, texto: 'Evaluadores Proyecto'),
            Filter(controlador: controlador, texto: 'Filtrar'),
          ],
        ),
      ),
    );
  }
}
