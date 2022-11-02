import 'package:flutter/material.dart';
import 'package:pegi/ui/widgets/Header.dart';

import '../../widgets/Mostrar.dart';

class AsignarEvaluador extends StatelessWidget {
  const AsignarEvaluador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Header(icon: Icons.arrow_back_rounded, texto: 'Asignar Evaluador'),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'pendiente',
                onPressed: () {},
                color: Colors.black,
                fijarIcon: false,
                padding: const EdgeInsets.only(left: 10, right: 25.0, top: 20)),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                height: 3,
                width: 350,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 4, color: Color.fromRGBO(30, 30, 30, 1)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
