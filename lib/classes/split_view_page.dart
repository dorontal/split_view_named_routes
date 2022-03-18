import 'package:flutter/material.dart';

/// Supply a non-empty: [url], or one of [menuIcon] and [menuText]
class SplitViewPage {
  final Widget page;
  String? url;
  final IconData? menuIcon;
  final String? menuText;

  SplitViewPage({
    required this.page,
    this.url,
    this.menuIcon,
    this.menuText,
  }) {
    if (menuText != null) {
      assert(menuText!.isNotEmpty, 'When supplied, [menuText] cannot be empty');
      url ??= menuText!.toLowerCase();
    }
    // at this point [url] cannot be empty or null because one must supply
    // either [url] or ([menuIcon] xor [menuText])
    assert(url!.isNotEmpty, 'Unable to determine [url]');
  }
}
