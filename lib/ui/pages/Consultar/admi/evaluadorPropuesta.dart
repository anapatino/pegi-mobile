import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/pages/Calificar/asignarEvaluadorPropuesta.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../domain/Controllers/controladorUsuario.dart';

class EvaluadorPropuesta extends StatefulWidget {
  const EvaluadorPropuesta({super.key});

  @override
  State<EvaluadorPropuesta> createState() => _EvaluadorPropuestaState();
}

class _EvaluadorPropuestaState extends State<EvaluadorPropuesta> {
  TextEditingController controlador = TextEditingController();
  ControlPropuesta controlp = Get.find();
  late Future<List<Propuesta>> listaPropuesta =
      PeticionesPropuesta.consultarTodasPropuestas();
  ControlUsuario controlu = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensiones.screenHeight * 0.02,
                horizontal: Dimensiones.screenWidth * 0.02),
            child: Column(
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Evaluadores Propuesta'),
                Filter(controlador: controlador, texto: 'Filtrar'),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: Dimensiones.screenHeight * 0.55,
                  width: Dimensiones.screenWidth * 0.89,
                  child: mostrarLista(),
                )
              ],
            ),
          ),
        ));
  }

  Widget mostrarLista() {
    List<String> lista = [];
    return ListView.builder(
      itemCount: controlp.getTodasPropuesta?.isEmpty == true
          ? 0
          : controlp.getTodasPropuesta!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Propuesta>>(
          future: listaPropuesta,
          builder: (context, posicion) {
            if (posicion.hasData) {
              return MostrarTodo(
                  texto: posicion.data![index].titulo.toString(),
                  tipo: posicion.data![index].idDocente
                              .toString()
                              .toLowerCase() ==
                          'Pendiente'
                      ? 'Pendiente'
                      : 'Asignado',
                  estado: true,
                  colorBoton: posicion.data![index].idDocente == ''
                      ? const Color.fromRGBO(91, 59, 183, 1)
                      : const Color.fromRGBO(18, 180, 122, 1),
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  fijarIcon: true,
                  icon: posicion.data![index].idDocente == ''
                      ? Icons.person_add_alt_rounded
                      : Icons.person_remove_rounded,
                  padding: EdgeInsets.only(
                      left: Dimensiones.screenWidth * 0.05,
                      right: Dimensiones.screenWidth * 0.05,
                      top: Dimensiones.screenHeight * 0.03),
                  onPressed: () async {
                    await controlu.consultarListaDocentes();
                    controlu.getListaDocentes
                        ?.map((user) => lista.add(user.nombre))
                        .toList();
                    lista.map((e) => log(e));
                    Get.to(() => AsignarEvaluadorPropuesta(
                          propuesta: posicion.data![index],
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
