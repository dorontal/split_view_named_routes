import 'package:flutter/material.dart';
import '../screens/first_page.dart';
import '../screens/second_page.dart';
import '../services/app_router.dart';

final List<MenuPage> menuPages = [
  MenuPage(
      url: 'page1',
      page: const FirstPage(),
      menuIcon: Icons.home,
      menuText: 'First page'),
  MenuPage(
      url: 'page2',
      page: const SecondPage(),
      menuIcon: Icons.table_bar,
      menuText: 'Second page')
];
