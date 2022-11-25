import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/propuesta.dart';
import 'package:pegi/ui/pages/consultar/estudiante/mostrarPropuesta.dart';
import 'package:pegi/ui/pages/consultar/estudiante/mostrarProyecto.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Header.dart';
import 'package:pegi/ui/widgets/Mostrar.dart';

import '../../../../data/services/peticionesPropuesta.dart';

class ConsultarPropuestas extends StatefulWidget {
  const ConsultarPropuestas({super.key});

  @override
  State<ConsultarPropuestas> createState() => _ConsultarPropuestasState();
}

class _ConsultarPropuestasState extends State<ConsultarPropuestas> {
  PeticionesPropuesta peticionesPropuesta = PeticionesPropuesta();
  late Future<List<Propuesta>> listaPropuesta =
      peticionesPropuesta.consultarPropuestas();
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
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Propuesta>>(
          future: listaPropuesta,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Mostrar(
                  texto: snapshot.data![index].titulo.toString(),
                  tipo: snapshot.data![index].estado.toString(),
                  colorTipo:
                      snapshot.data![index].estado.toString().toLowerCase() ==
                              'pendiente'
                          ? Color.fromARGB(255, 0, 0, 0)
                          : const Color.fromRGBO(18, 180, 122, 1),
                  colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
<<<<<<< HEAD
                    //  Get.to(() => const MostrarPropuesta());
=======
                    //Get.to(() => const MostrarPropuesta());
>>>>>>> f2775eba4741e40c5affe28bca37b0a3cfc577f7
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
