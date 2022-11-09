import 'package:flutter/material.dart';
import 'package:pegi/ui/pages/consultar/admi/consultarAdmin.dart';
import 'package:pegi/ui/pages/consultar/consultarDocente.dart';
import 'package:pegi/ui/pages/consultar/estudiante/consultarEstudiante.dart';
import 'package:pegi/ui/pages/dashboard/dashboardAdmin.dart';
import 'package:pegi/ui/pages/registrar/registrar.dart';
import '../../ui/pages/Dashboard/Dashboard.dart';
import '../../ui/pages/dashboard/dashboardEst.dart';

class Routes extends StatelessWidget {
  final int index;
  String rutaElejida;
  Routes({super.key, required this.index, required this.rutaElejida});

  @override
  Widget build(BuildContext context) {
    List<Widget> rutas = [];
    List<Widget> myRoutesDocente = [
      const Dashboard(),
      const ConsultarDocente(),
    ];
    List<Widget> myRoutesAdmin = [
      const DashboardAdmin(),
      const ConsultarAdmin(),
    ];
    List<Widget> myRoutesEstudiante = [
      const Registrar(),
      const DashboardEstudiante(),
      const ConsultarEstudiante(),
    ];
    if (rutaElejida == 'estudiante') {
      return myRoutesEstudiante[index];
    } else {
      if (rutaElejida == 'docente') {
        return myRoutesDocente[index];
      } else {
        if (rutaElejida == 'admi') {
          return myRoutesAdmin[index];
        }
      }
    }
    return rutas[index];
  }
}
