import 'package:booknote/constants.dart';
import 'package:booknote/view/feed.dart';
import 'package:booknote/view/home.dart';
import 'package:booknote/view/shop.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [Home(), Feed(), Shop()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: pages.elementAt(currentIndex),
    );
  }

  Widget BottomNav() {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.shopify), label: 'Shop'),
      ],
      selectedItemColor: lightOrange,
      unselectedItemColor: lightGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 8,
    );
  }
}
