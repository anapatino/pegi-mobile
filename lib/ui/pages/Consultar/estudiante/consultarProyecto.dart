import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/ui/pages/consultar/estudiante/mostrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../domain/Controllers/controlProyecto.dart';
import '../../../../domain/models/proyecto.dart';

class ConsultarProyecto extends StatefulWidget {
  const ConsultarProyecto({super.key});

  @override
  State<ConsultarProyecto> createState() => _ConsultarProyectoState();
}

class _ConsultarProyectoState extends State<ConsultarProyecto> {
  PeticionesProyecto peticionesProyecto = PeticionesProyecto();
  ControlProyecto controlp = Get.find();

  ControlUsuario controlu = Get.find();

  late Future<List<Proyecto>> listaProyecto =
      PeticionesProyecto.consultarProyectos(controlu.emailf);
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
                Column(
                  children: [mostrarLista()],
                )
              ],
            ),
          ),
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getproyectosGral?.isEmpty == true
          ? 0
          : controlp.getproyectosGral!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Proyecto>>(
          future: listaProyecto,
          builder: (context, posicion) {
            if (posicion.hasData) {
              return Mostrar(
                  texto: posicion.data![index].titulo.toString(),
                  tipo: posicion.data![index].estado.toString(),
                  colorTipo:
                      posicion.data![index].estado.toString().toLowerCase() ==
                              'pendiente'
                          ? const Color.fromRGBO(91, 59, 183, 1)
                          : const Color.fromRGBO(18, 180, 122, 1),
                  colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
                    Get.to(() => MostrarProyecto(
                          titulo: posicion.data![index].titulo.toString(),
                          estado: posicion.data![index].estado.toString(),
                        ));
                  });
            } else if (posicion.hasError) {
              return Text('${posicion.error}');
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
