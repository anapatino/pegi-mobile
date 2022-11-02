import 'package:flutter/material.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';

class EvaluadorPropuesta extends StatefulWidget {
  const EvaluadorPropuesta({super.key});

  @override
  State<EvaluadorPropuesta> createState() => _EvaluadorPropuestaState();
}

class _EvaluadorPropuestaState extends State<EvaluadorPropuesta> {
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
