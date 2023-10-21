import 'package:flutter/material.dart';

import '../../controller/homepageControler.dart';
import '../widgets/appBar.dart';
import '../widgets/navBar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel viewModel = HomeViewModel();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: const CustomAppBar(),
        body: viewModel.buildPage(_selectedIndex),
        bottomNavigationBar: MyNavigationBar(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
    );
  }
}
