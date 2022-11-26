import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesProyecto.dart';
import 'package:pegi/domain/Controllers/controlProyecto.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/pages/calificar/calificarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

class ConsultarProyectoDocente extends StatefulWidget {
  const ConsultarProyectoDocente({super.key});

  @override
  State<ConsultarProyectoDocente> createState() =>
      _ConsultarProyectoDocenteState();
}

class _ConsultarProyectoDocenteState extends State<ConsultarProyectoDocente> {
  PeticionesProyecto peticionesProyecto = PeticionesProyecto();
  ControlProyecto controlp = Get.find();

  ControlUsuario controlu = Get.find();

  late Future<List<Proyecto>> listaProyecto =
      PeticionesProyecto.consultarProyectos(controlu.emailf);
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
                Column(
                  children: [
                    Header(
                        icon: Icons.arrow_back_rounded,
                        texto: 'Consultar Proyectos'),
                    Filter(controlador: controlador, texto: 'Filtrar'),
                  ],
                ),
                Column(
                  children: [mostrarLista()],
                )
              ],
            ),
          )),
    );
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getproyectosDocentes?.isEmpty == true
          ? 0
          : controlp.getproyectosDocentes?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Proyecto>>(
          future: listaProyecto,
          builder: (context, posicion) {
            if (posicion.hasData) {
              return MostrarTodo(
                texto: posicion.data![index].titulo.toString(),
                colorBoton:
                    posicion.data![index].estado.toString().toLowerCase() ==
                            'pendiente'
                        ? const Color.fromRGBO(91, 59, 183, 1)
                        : const Color.fromRGBO(18, 180, 122, 1),
                estado: true,
                tipo: posicion.data![index].estado.toString(),
                onPressed: () {
                  Get.to(
                      () => CalificarProyecto(proyecto: posicion.data![index]));
                  ;
                },
                color: const Color.fromRGBO(30, 30, 30, 1),
                fijarIcon: true,
                icon: Icons.edit_outlined,
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 20),
              );
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
