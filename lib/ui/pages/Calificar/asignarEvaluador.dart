import 'package:flutter/material.dart';
import 'package:pegi/ui/widgets/Header.dart';

class AsignarEvaluadorPropuesta extends StatelessWidget {
  const AsignarEvaluadorPropuesta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Header(icon: Icons.arrow_back_rounded, texto: 'Asignar Evaluador'),
          ],
        ),
      ),
    );
  }
}
