import 'package:flutter/material.dart';

/// Supply a non-empty: [url], or one of [menuIcon] and [menuText]
class SplitViewMenuPage {
  final Widget page;
  late final String? url;
  final IconData? menuIcon;
  final String? menuText;

  SplitViewMenuPage({
    required this.page,
    this.url,
    this.menuIcon,
    this.menuText,
  }) {
    if (menuText != null) {
      assert(menuText!.isNotEmpty, 'When supplied, [menuText] cannot be empty');
      url ??= menuText!.toLowerCase();
    }
    // at this point url cannot be empty or null
    assert(url!.isNotEmpty, 'Unable to determine [url]');
  }
}
