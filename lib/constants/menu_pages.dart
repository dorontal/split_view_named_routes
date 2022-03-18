import 'package:flutter/material.dart';
import '../classes/split_view_page.dart';
import '../screens/first_page.dart';
import '../screens/second_page.dart';

//final List<SplitViewPage> menuPages = <SplitViewPage>[
final menuPages = [
  SplitViewPage(
      page: const FirstPage(), menuIcon: Icons.home, menuText: 'Page 1 (home)'),
  SplitViewPage(
      page: const SecondPage(), menuIcon: Icons.home, menuText: 'Page 2'),
];
