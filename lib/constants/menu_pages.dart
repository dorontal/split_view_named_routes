import 'package:flutter/material.dart';
import '../classes/split_view_page.dart';
import '../screens/first_page.dart';
import '../screens/second_page.dart';

final List<SplitViewPage> menuPages = [
  SplitViewPage(
      url: 'page1',
      page: const FirstPage(),
      menuIcon: Icons.home,
      menuText: 'First page'),
  SplitViewPage(
      url: 'page2',
      page: const SecondPage(),
      menuIcon: Icons.table_bar,
      menuText: 'Second page'),
];
