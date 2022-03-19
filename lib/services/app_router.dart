import 'package:flutter/material.dart';
import '../widgets/split_view.dart';
import '../widgets/app_menu.dart';
import '../widgets/tracktunes_logo.dart';

class MenuPage {
  final Widget page;
  final String url;
  final IconData menuIcon;
  final String menuText;

  MenuPage(
      {required this.page,
      required this.url,
      required this.menuIcon,
      required this.menuText});
}

class AppRouter {
  final List<MenuPage> menuPages;

  final Map<String, MenuPage> _itemsMap = {};

  AppRouter({required this.menuPages}) {
    for (var i = 0; i < menuPages.length; i++) {
      MenuPage menuPage = menuPages[i];
      _itemsMap[menuPage.url] = menuPage;
    }
  }

  void addRoute(String url, MenuPage menuPage) {
    _itemsMap[url] = menuPage;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final MenuPage menuPage =
        settings.name == '/' ? menuPages[0] : _itemsMap[settings.name]!;
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => SplitView(
            menu: AppMenu(
              menuPages: menuPages,
              header: const TracktunesLogo(),
            ),
            content: menuPage.page));
  }
}
