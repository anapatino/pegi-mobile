import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/pages/Consultar/admi/mostrarPropuesta.dart';
import 'package:pegi/ui/pages/calificar/asignarEvaluador.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
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
  PeticionesPropuesta peticionesPropuesta = PeticionesPropuesta();
  ControlPropuesta controlp = Get.find();

  ControlUsuario controlu = Get.find();

  late Future<List<Propuesta>> listaPropuesta =
      PeticionesPropuesta.consultarPropuestas(controlu.emailf);
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensiones.height5,
              horizontal: Dimensiones.screenWidth * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Evaluadores Propuesta'),
                Filter(controlador: controlador, texto: 'Filtrar'),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                mostrarLista()
              ],
            ),
          ),
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getTodasPropuesta?.isEmpty == true
          ? 0
          : controlp.getTodasPropuesta?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Propuesta>>(
          future: listaPropuesta,
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
                    /*Get.to(() =>
                        MostrarPropuesta(propuesta: posicion.data![index]));*/
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
