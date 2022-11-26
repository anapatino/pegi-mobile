import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/Controllers/controladorUsuario.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/pages/calificar/calificarPropuesta.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';
import '../../../widgets/Filter.dart';
import '../../../widgets/Header.dart';

class ConsultarPropuestaDocente extends StatefulWidget {
  const ConsultarPropuestaDocente({super.key});

  @override
  State<ConsultarPropuestaDocente> createState() =>
      _ConsultarPropuestaDocenteState();
}

class _ConsultarPropuestaDocenteState extends State<ConsultarPropuestaDocente> {
  TextEditingController controlador = TextEditingController();
  PeticionesPropuesta peticionesPropuesta = PeticionesPropuesta();
  ControlPropuesta controlp = Get.find();
  late Future<List<Propuesta>> listaPropuesta =
      PeticionesPropuesta.consultarPropuestas(controlu.emailf);
  ControlUsuario controlu = Get.find();
  @override
  Widget build(BuildContext context) {
    controlp.consultarPropuestasDocente(controlu.emailf).then((value) => null);
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
                        texto: 'Consultar Propuestas'),
                    Filter(controlador: controlador, texto: 'Filtrar'),
                  ],
                ),
                mostrarLista(),
              ],
            ),
          ),
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getPropuestaDocente?.isEmpty == true
          ? 0
          : controlp.getPropuestaDocente?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Propuesta>>(
          future: listaPropuesta,
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
                  Get.to(() =>
                      CalificarPropuesta(propuesta: posicion.data![index]));
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
