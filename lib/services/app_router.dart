import 'package:flutter/material.dart';

import '../classes/menu_page.dart';
import '../widgets/app_menu_header.dart';
import '../widgets/menu.dart';
import '../widgets/split_view.dart';

// Router service, meant to be used as a singleton, provided via Riverpod
class AppRouter {
  final Widget? headerPage;
  final String? headerUrl;
  final List<MenuPage> menuPages;
  final List<Function>? lowerMenuBuilders;

  final Map<String, Widget> _itemsMap = {};

  AppRouter({
    this.headerPage,
    this.headerUrl,
    required this.menuPages,
    this.lowerMenuBuilders,
  }) {
    if (headerPage != null) {
      _itemsMap[headerUrl!] = headerPage!;
    }

    for (var menuPage in menuPages) {
      if (menuPage.menuAction == null) {
        _itemsMap[menuPage.url!] = menuPage.page!;
      }
    }
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final url = settings.name;
    final Widget page =
        url == '/' ? menuPages[0].page! : _itemsMap[settings.name]!;
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => SplitView(
              menu: Menu(
                header: const AppMenuHeader(),
                menuPages: menuPages,
                lowerMenuBuilders: lowerMenuBuilders,
              ),
              content: page,
            ));
  }
}
