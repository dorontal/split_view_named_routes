import 'package:flutter/material.dart';

class MenuPage {
  final Widget page;
  final String url;
  final IconData? menuIcon;
  final String? menuText;
  final Function? menuAction;

  MenuPage({
    required this.page,
    required this.url,
    this.menuIcon,
    this.menuText,
    this.menuAction,
  });
}
