// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sprout/pages/homePage.dart';
import 'package:sprout/pages/profile.dart';
import 'package:sprout/pages/reminder.dart';
import 'package:sprout/pages/search.dart';
import '../model_data/colors.dart';

class NavHome extends StatefulWidget {
  @override
  _NavHomeState createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int index = 0;
  final screens = [HomePage(), SearchPage(), Reminder(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(indicatorColor: Shade.mesh),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: '',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: '',
              selectedIcon: Icon(Icons.search),
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              label: '',
              selectedIcon: Icon(Icons.notifications),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: '',
              selectedIcon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
