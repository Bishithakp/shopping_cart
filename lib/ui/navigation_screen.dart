import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/cart_page.dart';
import 'package:shopping_cart/ui/fruit_page.dart';
import 'package:shopping_cart/ui/home_page.dart';
import 'package:shopping_cart/ui/vegetables_page.dart';

import '../constants/app_color.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedindex = 0;
  final pages = [
    const HomePage(),
    const CartPage(),
    const FruitPage(),
    const VegetablesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home',
              backgroundColor: AppColor.groundColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 25,
              ),
              label: 'Cart',
              backgroundColor: AppColor.groundColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 25,
              ),
              label: 'favorite',
              backgroundColor: AppColor.groundColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin_circle_outlined,
                size: 25,
              ),
              label: 'Profile',
              backgroundColor: AppColor.groundColor)
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedindex,
        selectedItemColor: AppColor.appMainColor,
        unselectedItemColor: AppColor.headingColor,
        elevation: 6,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
    );
  }
}
