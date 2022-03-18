import 'package:flutter/material.dart';

/// Supply a non-empty: [url], or one of [menuIcon] and [menuText]
class SplitViewPage {
  final Widget page;
  final String url;
  final IconData menuIcon;
  final String menuText;

  SplitViewPage({
    required this.page,
    required this.url,
    required this.menuIcon,
    required this.menuText,
  });
}
