//! Will probably not be included in the final build

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../posts/pages/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  List<Widget> pages = [
    const HomePage(),
    const Text('Favorites'),
    const Text('Notifications'),
    const Text('Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          currentIndex: index,
          onTap: (int newIndex) => setState(() {
                index = newIndex;
              }),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/email.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/like_24x.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/notification.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/settings.svg'), label: ''),
          ]),
    );
  }
}
