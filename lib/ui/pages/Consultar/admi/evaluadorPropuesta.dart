import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/data/services/peticionesPropuesta.dart';
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
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Propuesta>>(
          future: listaPropuesta,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Mostrar(
                  texto: snapshot.data![index].areaTematica.toString(),
                  tipo: 'pendiente',
                  colorTipo: const Color.fromRGBO(91, 59, 183, 1),
                  colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
                    Get.to(() => const MostrarPropuesta());
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
