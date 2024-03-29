import 'package:flutter/material.dart';
import 'package:formula_c/screens/Reviewpage.dart';
import 'package:formula_c/screens/add.dart';
import 'package:formula_c/screens/home.dart';
import 'package:formula_c/screens/maps_screen.dart';
import 'package:formula_c/screens/profile.dart';
import 'package:ionicons/ionicons.dart';

import 'notifications.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  List icons = [
    Icons.home,
    Icons.map_sharp,
    Icons.reviews,
    Icons.person,
  ];
  List pages = [
    Home(),
    MapsScreen(),
    ReviewPage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) =>  pages[index] ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[           
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(2),
            buildTabIcon(3),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 10.0,
      //   child: Icon(
      //     Icons.add,
      //   ),
      //   onPressed: () => _pageController.jumpToPage(2),
      // ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  buildTabIcon(int index) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(index == 3 ? 30 : 0, 0, index == 1 ? 30 : 0, 0),
      child: IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        color: _page == index
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).textTheme.bodySmall?.color,
        onPressed: () => _pageController.jumpToPage(index),
      ),
    );
  }
}
