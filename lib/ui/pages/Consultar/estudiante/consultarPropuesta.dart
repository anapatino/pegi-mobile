import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/Controllers/controlPropuesta.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/pages/Consultar/estudiante/mostrarPropuesta.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../data/services/peticionesPropuesta.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';

class ConsultarPropuestas extends StatefulWidget {
  const ConsultarPropuestas({super.key});

  @override
  State<ConsultarPropuestas> createState() => _ConsultarPropuestasState();
}

class _ConsultarPropuestasState extends State<ConsultarPropuestas> {
  PeticionesPropuesta peticionesPropuesta = PeticionesPropuesta();
  ControlPropuesta controlp = Get.find();

  ControlUsuario controlu = Get.find();

  late Future<List<Propuesta>> listaPropuesta =
      PeticionesPropuesta.consultarPropuestas(controlu.emailf);
  TextEditingController controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controlp.consultarPropuestas(controlu.emailf).then((value) => null);

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
                mostrarLista()
              ],
            ),
          ),
        ));
  }

  Widget mostrarLista() {
    return ListView.builder(
      itemCount: controlp.getproyectosGral?.isEmpty == true
          ? 0
          : controlp.getproyectosGral?.length,
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
                    Get.to(() =>
                        MostrarPropuesta(propuesta: posicion.data![index]));
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
