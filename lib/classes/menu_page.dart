import 'package:flutter/material.dart';

class MenuPage {
  final Widget page;
  final String url;
  final IconData? menuIcon;
  final String? menuText;
  final Function? menuAction;

  // you cannot have both 'action' and ('page' or 'url') not null and they
  // cannot all be null
  MenuPage({
    required this.page,
    required this.url,
    this.menuIcon,
    this.menuText,
    this.menuAction,
  });
}
