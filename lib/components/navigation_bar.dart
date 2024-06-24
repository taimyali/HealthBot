import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar(
      {super.key, this.selectedIndex, required this.onItemSelected});

  var selectedIndex;
  final void Function(int) onItemSelected;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(
            28.r,
            28.r,
          ),
          topRight: Radius.elliptical(
            28.r,
            28.r,
          )),
      child: FlashyTabBar(
        backgroundColor: themecolor,
        selectedIndex: widget.selectedIndex,
        showElevation: true,
        onItemSelected: widget.onItemSelected,
        items: [
          FlashyTabBarItem(
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            icon: const Icon(HeroIcons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            icon: const Icon(EvaIcons.clock),
            title: const Text('History'),
          ),
          FlashyTabBarItem(
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            icon: const Icon(Icons.medical_services_rounded),
            title: const Text('Doctors'),
          ),
          FlashyTabBarItem(
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            icon: const Icon(Icons.article_rounded),
            title: const Text('Articles'),
          ),
          FlashyTabBarItem(
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            icon: const Icon(Icons.fitness_center_rounded),
            title: const Text('Exercises'),
          ),
        ],
      ),
    );
  }
}
