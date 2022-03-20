import 'package:flutter/material.dart';
import '../screens/first.dart';
import '../screens/second.dart';
import '../widgets/menu.dart';

final List<MenuPage> menuPages = [
  MenuPage(
      url: 'first-page',
      page: const First(),
      menuIcon: Icons.home,
      menuText: 'First page'),
  MenuPage(
      url: 'second-page',
      page: const Second(),
      menuIcon: Icons.table_bar,
      menuText: 'Second page')
];
