import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  final Function currentIndex;
  const BottomMenu({super.key, required this.currentIndex});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white,
      selectedItemColor: Color.fromRGBO(113, 77, 217, 1),
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_outlined), label: "")
      ],
    );
  }
}
