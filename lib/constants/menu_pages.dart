import 'package:flutter/material.dart';
import 'package:split_view_named_routes/widgets/ok_alert.dart';
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

final List<MenuPage> menuPages2 = [
  MenuPage(
      menuIcon: Icons.last_page_rounded,
      menuText: 'Click me',
      menuAction: (context) {
        showOKAlert(context, message: 'Clicked me!');
      })
];
