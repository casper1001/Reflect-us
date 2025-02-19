import 'dart:math';

import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.inx}) : super(key: key);
  final int inx;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  late int inx;

  @override
  void initState() {
    super.initState();
    inx = widget.inx;
  }

  static const _pages = [
    '/Home',
    '/Profile',
    '/CommunityScreen',
  ];

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'nav',

      child: IconTheme(
        data: IconThemeData(
          color: Colors.white
        ),
        child: CircleNavBar(
          activeIndex:inx,
          onTap: (newInx){
            if(widget.inx == newInx) return;
            setState(() {
              inx = newInx;
            });
            Future.delayed(const Duration(milliseconds: 150),()=>Get.offNamed(_pages[inx]));
          },
          activeIcons: const [
            Icon(Icons.home),
            Icon(Icons.person_rounded),
            Icon(Icons.add_chart),
          ],
          inactiveIcons: const [
            Icon(Icons.home_outlined),
            Icon(Icons.person_outline_rounded),
            Icon(Icons.add_chart_outlined),
          ],
          height: 15.w,
          circleWidth: 15.w,
          color: const Color(0xFF416FDF),
        ),
      ),
    );
  }
}
