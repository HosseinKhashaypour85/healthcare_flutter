import 'package:flutter/material.dart';
import 'package:healthcare_flutter/const/theme/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../home_features/screen/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  static const String screenId = 'bottomNav';

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> locationKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> addPostKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> profileKey = GlobalKey<NavigatorState>();

  List<Widget> _buildScreens() {
    return [
      Navigator(
        key: homeKey,
        onGenerateRoute:
            (settings) => MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
      Navigator(
        key: locationKey,
        onGenerateRoute:
            (settings) => MaterialPageRoute(builder: (context) => Container()),
      ),
      Navigator(
        key: addPostKey,
        onGenerateRoute:
            (settings) => MaterialPageRoute(builder: (context) => Container()),
      ),
      Navigator(
        key: profileKey,
        onGenerateRoute:
            (settings) => MaterialPageRoute(builder: (context) => Container()),
      ),
      Navigator(
        key: null,
        onGenerateRoute:
            (settings) => MaterialPageRoute(builder: (context) => Container()),
      ),
      // Navigator(
      //   key: homeKey,
      //   onGenerateRoute:
      //       (settings) => MaterialPageRoute(builder: (context) => Container()),
      // ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.fastfood_outlined),
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add, color: Colors.white),
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_outline),
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      items: _navBarItems(),
      backgroundColor: primaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style15,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
    );
  }
}
