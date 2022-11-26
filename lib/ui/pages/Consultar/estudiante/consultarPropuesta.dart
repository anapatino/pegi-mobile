import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/consultar/estudiante/mostrarPropuesta.dart';
import 'package:pegi/ui/pages/consultar/estudiante/mostrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

class ConsultarPropuestas extends StatefulWidget {
  const ConsultarPropuestas({super.key});

  @override
  State<ConsultarPropuestas> createState() => _ConsultarPropuestasState();
}

class _ConsultarPropuestasState extends State<ConsultarPropuestas> {
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.height5, horizontal: Dimensiones.width5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensiones.height2),
                  child: Column(
                    children: [
                      Header(
                          icon: Icons.arrow_back_rounded,
                          texto: 'Consultar Propuestas'),
                      Padding(
                        padding: EdgeInsets.only(bottom: Dimensiones.height2),
                        child: Container(
                          height: Dimensiones.height5,
                          width: Dimensiones.width90,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 4,
                                  color: Color.fromRGBO(30, 30, 30, 1)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Mostrar(
                    texto: 'Harina base de \ninsectos.',
                    tipo: 'pendiente',
                    colorTipo: const Color.fromRGBO(91, 59, 183, 1),
                    colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                    onPressed: () {
                      Get.to(() => const MostrarPropuesta());
                    }),
                Mostrar(
                    texto: 'Harina base de \ninsectos.',
                    tipo: 'calificado',
                    colorTipo: const Color.fromRGBO(26, 185, 127, 1),
                    colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                    onPressed: () {
                      Get.to(() => const MostrarPropuesta());
                    }),
              ],
            ),
          ),
        ));
  }
}
