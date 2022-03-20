import 'package:flutter/material.dart';
import '../classes/menu_page.dart';
import '../widgets/about_header.dart';
import '../widgets/split_view.dart';
import '../widgets/menu.dart';

// Router service for the demo app - this service is meant to be used as
// as singleton, provided via Riverpod
class AppRouter {
  final Widget? headerPage;
  final String? headerUrl;
  final List<MenuPage> menuPages;

  final Map<String, MenuPage> _itemsMap = {};

  AppRouter({this.headerPage, this.headerUrl, required this.menuPages}) {
    if (headerPage != null) {
      _itemsMap[headerUrl!] = MenuPage(page: headerPage!, url: headerUrl!);
    }
    for (var i = 0; i < menuPages.length; i++) {
      final menuPage = menuPages[i];
      _itemsMap[menuPage.url] = menuPage;
    }
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final url = settings.name;
    final Widget page =
        url == '/' ? menuPages[0].page : _itemsMap[settings.name]!.page;
    return MaterialPageRoute(
        settings: settings,
        builder: (context) => SplitView(
              menu: Menu(menuPages: menuPages, header: const AboutHeader()),
              content: page,
            ));
  }
}
