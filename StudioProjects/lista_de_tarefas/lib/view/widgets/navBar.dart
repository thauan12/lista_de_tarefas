import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const MyNavigationBar({super.key, required this.selectedIndex, required this.onTabChange});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return GNav(
      tabMargin: EdgeInsets.fromLTRB(30, 5, 30, 5),
      iconSize: 20,
      activeColor: Colors.black,
      tabBorderRadius: 30,
      backgroundColor: Colors.blueGrey,
      color: Colors.white,
      tabBackgroundColor: Colors.white,
      gap: 8,
      textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      onTabChange: widget.onTabChange,
      tabs: const [
        GButton(
          icon: FontAwesomeIcons.list,
          text: 'Novas',
        ),
        GButton(
          icon: FontAwesomeIcons.listCheck,
          text: 'Concluidas',
        ),

      ],
      selectedIndex: widget.selectedIndex,
    );
  }
}
