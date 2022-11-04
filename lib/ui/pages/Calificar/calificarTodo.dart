import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Calificar.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import 'package:pegi/ui/widgets/botones.dart';

class CalificarT extends StatefulWidget {
  const CalificarT({super.key});

  @override
  State<CalificarT> createState() => _CalificarTState();
}

class _CalificarTState extends State<CalificarT> {
  TextEditingController controlador = TextEditingController();
  TextEditingController control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
        child: Column(
          children: <Widget>[
            Header(
                icon: Icons.arrow_back_rounded, texto: 'Calificar Proyectos'),
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
            Calificar(
              controlador: controlador,
              control: control,
            ),
            const Botones(texto: "Enviar")
          ],
        ),
      ),
    );
  }
}
