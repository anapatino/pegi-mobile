import 'package:flutter/material.dart';
import 'package:pegi/ui/pages/Dashboard.dart';

import '../../ui/pages/ConsultaDocente.dart';

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
