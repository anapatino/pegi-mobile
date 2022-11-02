import 'package:flutter/material.dart';
import 'package:pegi/ui/pages/Consultar/consultarDocente.dart';
import 'package:pegi/ui/pages/consultar/consultarAdmin.dart';
import 'package:pegi/ui/pages/dashboard/dashboardAdmin.dart';
import '../../ui/pages/Dashboard/Dashboard.dart';
import '../../ui/pages/calificar/asignarEvaluador.dart';
import '../../ui/pages/dashboard/dashboardEst.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myRoutes = [
      const Dashboard(),
      const ConsultarDocente(),
    ];
    return myRoutes[index];
  }
}
