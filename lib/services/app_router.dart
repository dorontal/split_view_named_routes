import 'package:flutter/material.dart';
import '../widgets/about_header.dart';
import '../widgets/menu.dart';
import '../widgets/split_view.dart';

// Router service for the demo app - this service is meant to be used as
// as singleton, provided via Riverpod
class AppRouter {
  final Widget? headerPage;
  final String? headerUrl;
  final List<MenuPage> menuPages;
  final List<MenuPage>? menuPages2;

  final Map<String, MenuPage> _itemsMap = {};

  AppRouter({
    this.headerPage,
    this.headerUrl,
    required this.menuPages,
    this.menuPages2,
  }) {
    if (headerPage != null) {
      _itemsMap[headerUrl!] = MenuPage(page: headerPage!, url: headerUrl!);
    }

    for (var menuPage in menuPages) {
      if (menuPage.menuAction == null) {
        _itemsMap[menuPage.url!] = menuPage;
      }
    }

    if (menuPages2 != null) {
      for (var menuPage in menuPages2!) {
        if (menuPage.menuAction == null) {
          _itemsMap[menuPage.url!] = menuPage;
        }
      }
    }
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final url = settings.name;
    final Widget page =
        url == '/' ? menuPages[0].page! : _itemsMap[settings.name]!.page!;
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => SplitView(
              menu: Menu(
                  menuPages: menuPages,
                  menuPages2: menuPages2,
                  header: const AboutHeader()),
              content: page,
            ));
  }
}
