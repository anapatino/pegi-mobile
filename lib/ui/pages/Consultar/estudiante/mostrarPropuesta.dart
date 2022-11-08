import 'package:flutter/material.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

class MostrarPropuesta extends StatelessWidget {
  const MostrarPropuesta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Consultar Propuesta'),
            MostrarTodo(
                texto: 'Harina base de \ninsectos.',
                colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                estado: true,
                tipo: 'Pendiente',
                onPressed: () {},
                color: Colors.black,
                fijarIcon: true,
                icon: Icons.mode_edit_outline_rounded,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensiones.screenWidth * 0.06,
                    vertical: Dimensiones.height2)),
            Padding(
              padding:
                  EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.0001),
              child: Container(
                height: Dimensiones.screenHeight * 0.0001,
                width: Dimensiones.width90,
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
