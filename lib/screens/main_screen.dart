import 'package:expenz/constants/colors.dart';
import 'package:expenz/screens/add_screen.dart';
import 'package:expenz/screens/budget_screen.dart';
import 'package:expenz/screens/dashboard.dart';
import 'package:expenz/screens/profile_screen.dart';
import 'package:expenz/screens/transaction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),

      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 5),
      backgroundColor: kWhite,
      isVisible: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),

          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 400),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
    );
  }

  List<Widget> _buildScreens() {
    return [
      AddScreen(),
      Dashboard(),
      TransactionScreen(),

      BudgetScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: Icon(CupertinoIcons.home, size: 30),
        icon: Icon(CupertinoIcons.house_fill, size: 30),
        title: ("Home"),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: kGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.money_dollar,
          size: 30, // Adjusted size to 30
        ),
        title: ("Transaction"),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: kGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.add_circled,
          size: 30, // Adjusted size to 30
        ),
        title: ("Add"),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: kGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.chart_bar_circle,
          size: 30, // Adjusted size to 30
        ),
        title: ("Budget"),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: kGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.profile_circled,
          size: 30, // Adjusted size to 30
        ),
        title: ("Profile"),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: kGrey,
      ),
    ];
  }
}
