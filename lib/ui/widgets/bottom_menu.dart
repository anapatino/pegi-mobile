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
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
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
                  icon: Icon(Icons.edit_note_sharp), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monitor_weight_outlined), label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
