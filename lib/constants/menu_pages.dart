import 'package:flutter/material.dart';
import 'package:split_view_named_routes/widgets/ok_alert.dart';
import '../classes/menu_page.dart';
import '../screens/first.dart';
import '../screens/second.dart';

final List<MenuPage> menuPages = [
  MenuPage(
      url: 'first-page',
      page: const First(),
      menuIcon: Icons.home,
      menuText: 'First page'),
  MenuPage(
      url: 'second-page',
      page: const Second(),
      menuIcon: Icons.person,
      menuText: 'Second page')
];

final List<MenuPage> menuPages2 = [
  MenuPage(
      menuIcon: Icons.mouse,
      menuText: 'Click me',
      menuAction: (context) {
        showOKAlert(context, message: 'Clicked!');
      })
];
