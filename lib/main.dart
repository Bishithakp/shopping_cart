import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/cart_page.dart';
import 'package:shopping_cart/ui/fruit_page.dart';
import 'package:shopping_cart/ui/home_page.dart';
import 'package:shopping_cart/ui/login_page.dart';
import 'package:shopping_cart/ui/vegetables_page.dart';

import 'ui/navigation_screen.dart';void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationScreen(),
    );
  }
}

