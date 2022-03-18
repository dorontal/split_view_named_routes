import 'package:flutter/material.dart';

class MenuPage {
  final Widget page;
  final String url;
  final IconData menuIcon;
  final String menuText;

  MenuPage(
      {required this.page,
      required this.url,
      required this.menuIcon,
      required this.menuText});
}
