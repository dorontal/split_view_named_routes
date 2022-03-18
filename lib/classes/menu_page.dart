import 'package:flutter/material.dart';

/// Supply a non-empty: [url], or one of [menuIcon] and [menuText]
class MenuPage {
  final Widget page;
  final String url;
  final IconData menuIcon;
  final String menuText;

  MenuPage({
    required this.page,
    required this.url,
    required this.menuIcon,
    required this.menuText,
  });
}
