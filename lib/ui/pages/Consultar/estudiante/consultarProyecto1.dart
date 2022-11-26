import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/consultar/estudiante/mostrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../domain/models/proyecto.dart';

class ConsultarProyecto extends StatefulWidget {
  const ConsultarProyecto({super.key});

  @override
  State<ConsultarProyecto> createState() => _ConsultarProyectoState();
}

class _ConsultarProyectoState extends State<ConsultarProyecto> {
  ControlUsuario controlu = Get.find();
  ControlProyecto controlp = Get.find();
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controlp.consultarProyectos(controlu.emailf).then((value) => null);
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
                Obx(
                  () => controlp.getproyectosGral?.isEmpty == false
                      ? ListView.builder(
                          itemCount: controlp.getproyectosGral?.isEmpty == true
                              ? 0
                              : controlp.getproyectosGral!.length,
                          itemBuilder: (context, posicion) {
                            return Mostrar(
                                texto: controlp
                                    .getproyectosGral![posicion].titulo
                                    .toString(),
                                tipo: controlp
                                    .getproyectosGral![posicion].estado
                                    .toString(),
                                colorTipo: controlp
                                            .getproyectosGral![posicion].estado
                                            .toString()
                                            .toLowerCase() ==
                                        'pendiente'
                                    ? const Color.fromRGBO(91, 59, 183, 1)
                                    : const Color.fromRGBO(18, 180, 122, 1),
                                colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                                onPressed: () {
                                  Get.to(() => MostrarProyecto(
                                        titulo: controlp
                                            .getproyectosGral![posicion].titulo
                                            .toString(),
                                        estado: controlp
                                            .getproyectosGral![posicion].estado
                                            .toString(),
                                      ));
                                });
                          })
                      : const Icon(Icons.abc),
                ),
              ],
            ),
          ),
        ));
  }
}
