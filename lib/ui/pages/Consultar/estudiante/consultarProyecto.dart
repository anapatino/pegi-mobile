import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/Consultar/estudiante/mostrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../domain/Controllers/controlProyecto.dart';
import '../../../../domain/models/proyecto.dart';

class ConsultarProyecto extends StatelessWidget {
  const ConsultarProyecto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController controlador = TextEditingController();
    // PeticionesProyecto peticionesProyecto = PeticionesProyecto();

    // late List<Proyecto> listaProyecto;

    // consulta() async {
    //   final x = await PeticionesProyecto.consultarProyectos(controlu.emailf);
    //   listaProyecto = x;
    // }
    ControlProyecto controlp = Get.find();
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
                        padding: EdgeInsets.only(
                            bottom: Dimensiones.screenHeight * 0.00000001),
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
<<<<<<< HEAD
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Mostrar(
                          texto: 'Harina base de \ninsectos.',
                          tipo: 'pendiente',
                          colorTipo: const Color.fromRGBO(91, 59, 183, 1),
                          colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                          onPressed: () {
                            Get.to(() => const MostrarProyecto());
                          }),
                      Mostrar(
                          texto: 'Harina base de \ninsectos.',
                          tipo: 'calificado',
                          colorTipo: const Color.fromRGBO(26, 185, 127, 1),
                          colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                          onPressed: () {
                            Get.to(() => const MostrarProyecto());
                          }),
                    ],
                  ),
                )
=======
                Column(children: [
                  Obx(
                    () => controlp.getproyectosGral?.isEmpty == false
                        ? ListView.builder(
                            itemCount:
                                controlp.getproyectosGral?.isEmpty == true
                                    ? 0
                                    : controlp.getproyectosGral!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, posicion) {
                              return Mostrar(
                                  texto: controlp
                                      .getproyectosGral![posicion].titulo
                                      .toString(),
                                  tipo: controlp
                                      .getproyectosGral![posicion].estado
                                      .toString(),
                                  colorTipo: controlp
                                              .getproyectosGral![posicion]
                                              .estado
                                              .toString()
                                              .toLowerCase() ==
                                          'pendiente'
                                      ? const Color.fromRGBO(91, 59, 183, 1)
                                      : const Color.fromRGBO(18, 180, 122, 1),
                                  colorBoton:
                                      const Color.fromRGBO(30, 30, 30, 1),
                                  onPressed: () {
                                    Get.to(() => MostrarProyecto(
                                        proyecto: controlp
                                            .getproyectosGral![posicion]));
                                  });
                            },
                          )
                        : const Icon(Icons.abc),
                  )
                ])
>>>>>>> origin/anap
              ],
            ),
          ),
        ));
  }
}
