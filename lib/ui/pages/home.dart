import 'package:flutter/material.dart';

import '../../domain/models/routes.dart';
import '../widgets/bottom_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  BottomMenu? myMenu;

  @override
  void initState() {
    myMenu = BottomMenu(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: myMenu, body: Routes(index: index));
  }
}
