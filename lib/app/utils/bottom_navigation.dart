import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/modules/navigation/explore/views/explore_view.dart';
import 'package:squidgame/app/modules/navigation/home/views/home_view.dart';
import 'package:squidgame/app/modules/navigation/profile/views/profile_view.dart';
import 'package:squidgame/app/utils/app_color.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> _options = [HomeView(), ExploreView(), ProfileView()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _options[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 65.0,
        buttonBackgroundColor: AppColors.bluePrimary,
        backgroundColor: Colors.white,
        color: AppColors.bluePrimary,
        animationCurve: Curves.ease,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.explore_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
