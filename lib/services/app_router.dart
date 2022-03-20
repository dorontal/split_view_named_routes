import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import '../widgets/app_menu_header.dart';
import '../widgets/split_view.dart';
import '../widgets/app_menu.dart';

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

class AppRouter {
  final List<MenuPage> menuPages;

  final Map<String, MenuPage> _itemsMap = {};

  AppRouter({required this.menuPages}) {
    for (var i = 0; i < menuPages.length; i++) {
      addRoute(menuPages[i]);
    }
  }

  void addRoute(MenuPage menuPage) {
    dev.log('adding route ${menuPage.url}');
    dev.inspect(menuPage);
    _itemsMap[menuPage.url] = menuPage;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final url = settings.name;
    final Widget page =
        url == '/' ? menuPages[0].page : _itemsMap[settings.name]!.page;
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => SplitView(
              menu:
                  AppMenu(menuPages: menuPages, header: const AppMenuHeader()),
              content: page,
            ));
  }
}
