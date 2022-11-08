import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/ui/pages/consultar/estudiante/mostrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

class ConsultarProyecto extends StatefulWidget {
  const ConsultarProyecto({super.key});

  @override
  State<ConsultarProyecto> createState() => _ConsultarProyectoState();
}

class _ConsultarProyectoState extends State<ConsultarProyecto> {
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
                          texto: 'Consultar Proyecto'),
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
                MostrarTodo(
                    texto: 'Harina base de \ninsectos.',
                    colorBoton: const Color.fromRGBO(91, 59, 183, 1),
                    estado: true,
                    tipo: 'pendiente',
                    onPressed: () {
                      Get.to(() => const MostrarProyecto());
                    },
                    color: const Color.fromRGBO(30, 30, 30, 1),
                    fijarIcon: false,
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 20)),
                MostrarTodo(
                  texto: 'Harina base de \ninsectos.',
                  colorBoton: const Color.fromRGBO(26, 185, 127, 1),
                  estado: true,
                  tipo: 'calificado',
                  onPressed: () {
                    Get.to(() => const MostrarProyecto());
                  },
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  fijarIcon: false,
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
