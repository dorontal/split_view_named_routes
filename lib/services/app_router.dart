import 'package:flutter/material.dart';
import '../classes/menu_page.dart';
import '../widgets/app_menu_header.dart';
import '../widgets/menu.dart';
import '../widgets/split_view.dart';

// Router service for the demo app - this service is meant to be used as
// as singleton, provided via Riverpod
class AppRouter {
  final Widget? headerPage;
  final String? headerUrl;
  final List<MenuPage> menuPages;
  final List<MenuPage>? menuPages2;

  final Map<String, Widget> _itemsMap = {};

  void _addItemsMap(MenuPage menuPage) {
    if (menuPage.menuAction == null) {
      _itemsMap[menuPage.url!] = menuPage.page!;
    }
  }

  AppRouter({
    this.headerPage,
    this.headerUrl,
    required this.menuPages,
    this.menuPages2,
  }) {
    if (headerPage != null) {
      _itemsMap[headerUrl!] = headerPage!;
    }

    for (var menuPage in menuPages) {
      _addItemsMap(menuPage);
    }

    if (menuPages2 != null) {
      for (var menuPage in menuPages2!) {
        _addItemsMap(menuPage);
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
                menuPages2: menuPages2,
              ),
              content: page,
            ));
  }
}
