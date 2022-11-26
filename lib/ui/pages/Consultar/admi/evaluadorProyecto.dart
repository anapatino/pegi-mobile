import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegi/domain/models/proyecto.dart';
import 'package:pegi/ui/pages/Consultar/admi/mostrarProyecto.dart';
import 'package:pegi/ui/widgets/Consulta.dart';
import 'package:pegi/ui/widgets/Filter.dart';
import 'package:pegi/ui/widgets/Header.dart';
import '../../../../data/services/peticionesProyecto.dart';
import '../../../../domain/Controllers/controladorUsuario.dart';
import '../../../utils/Dimensiones.dart';
import '../../../widgets/Mostrar.dart';
import '../../calificar/asignarEvaluador.dart';

class EvaluadorProyecto extends StatefulWidget {
  const EvaluadorProyecto({super.key});

  @override
  State<EvaluadorProyecto> createState() => _EvaluadorProyectoState();
}

class _EvaluadorProyectoState extends State<EvaluadorProyecto> {
  PeticionesProyecto peticionesProyecto = PeticionesProyecto();
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
              vertical: Dimensiones.height5,
              horizontal: Dimensiones.screenWidth * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(
                    icon: Icons.arrow_back_rounded,
                    texto: 'Evaluadores Proyecto'),
                Filter(controlador: controlador, texto: 'Filtrar'),
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
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Proyecto>>(
          future: listaProyecto,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Mostrar(
                  texto: snapshot.data![index].titulo.toString(),
                  tipo: snapshot.data![index].estado.toString(),
                  colorTipo:
                      snapshot.data![index].estado.toString().toLowerCase() ==
                              'pendiente'
                          ? const Color.fromRGBO(91, 59, 183, 1)
                          : const Color.fromRGBO(18, 180, 122, 1),
                  colorBoton: const Color.fromRGBO(30, 30, 30, 1),
                  onPressed: () {
                    Get.to(() => MostrarProyecto(
                          titulo: snapshot.data![index].titulo.toString(),
                          estado: snapshot.data![index].estado.toString(),
                        ));
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
