import 'package:flutter/material.dart';
import 'package:pegi/ui/pages/consultar/consultar.dart';
import 'package:pegi/ui/pages/dashboard/dashboard.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myRoutes = [
      const Dashboard(),
      const Consultar(),
    ];
    return myRoutes[index];
  }
}
