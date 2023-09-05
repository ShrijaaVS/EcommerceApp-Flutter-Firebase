

import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/home_page/widgets/home_screen_design.dart';
import 'package:ecommerceapp/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerceapp/screens/notifications/notification_screen.dart';
import 'package:ecommerceapp/screens/profile/profiles_screen.dart';
import 'package:ecommerceapp/app_resources/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int homeIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                const HomePageDesign(),
                ShoppingCart(pageController: _pageController),
                Notifications(pageController: _pageController),
                Profile(pageController: _pageController),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(55.0),
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10.0,
                spreadRadius: 0.5,
                offset: const Offset(-0.5, -0.5), // Adjust the offset to control the shadow position
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              selectedLabelStyle: klabelsStyle,
              showUnselectedLabels: false,
              elevation: 4.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.shopping_cart),
                  label: 'Shopping Cart',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: currentIndex,
              selectedItemColor: Colors.black,
              onTap: _onNavItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
