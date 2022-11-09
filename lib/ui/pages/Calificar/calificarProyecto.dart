import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Button.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Input.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

class CalificarProyecto extends StatefulWidget {
  const CalificarProyecto({super.key});

  @override
  State<CalificarProyecto> createState() => _CalificarProyectoState();
}

class _CalificarProyectoState extends State<CalificarProyecto> {
  TextEditingController controlCalificacion = TextEditingController();
  TextEditingController controlRetroalimentacion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Calificar Proyectos'),
                MostrarTodo(
                    texto: 'Harina base de \ninsectos.',
                    colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                    estado: true,
                    tipo: 'pendiente',
                    onPressed: () {},
                    color: Colors.black,
                    fijarIcon: false,
                    padding:
                        const EdgeInsets.only(left: 10, right: 25.0, top: 20)),
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
                InputMedium(
                  controlRetroalimentacion,
                  "Retroalimentacion",
                  EdgeInsets.symmetric(
                      vertical: Dimensiones.screenHeight * 0.02),
                  Colors.white,
                  const Color.fromRGBO(30, 30, 30, 1),
                ),
                Input(
                  false,
                  controlCalificacion,
                  "Calificacion",
                  const EdgeInsets.all(0),
                  const EdgeInsets.only(bottom: 8),
                  const Color.fromRGBO(30, 30, 30, 1),
                  Colors.white,
                ),
                Button(
                  texto: "Enviar",
                  color: const Color.fromRGBO(91, 59, 183, 1),
                  colorTexto: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
