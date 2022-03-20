import 'package:flutter/material.dart';
import '../about.dart';
import '../widgets/split_view.dart';
import '../widgets/app_menu.dart';

const headerUrl = 'header';

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
  final _header = const About();

  AppRouter({required this.menuPages}) {
    for (var i = 0; i < menuPages.length; i++) {
      MenuPage menuPage = menuPages[i];
      _itemsMap[menuPage.url] = menuPage;
    }
  }

  void addRoute(String url, MenuPage menuPage) {
    assert(url != headerUrl);
    _itemsMap[url] = menuPage;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final url = settings.name;
    final Widget page = url == headerUrl
        ? _header
        : (url == '/' ? menuPages[0].page : _itemsMap[settings.name]!.page);
    return MaterialPageRoute(
        settings: settings,
        builder: (context) =>
            SplitView(menu: AppMenu(menuPages: menuPages), content: page));
  }
}
