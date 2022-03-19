import 'package:flutter/material.dart';
import '../widgets/split_view.dart';
import '../widgets/app_menu.dart';
import '../widgets/tracktunes_logo.dart';
import 'menu_page.dart';

class DrawerRoutes {
  final List<MenuPage> menuPages;

  final Map<String, MenuPage> _itemsMap = {};

  DrawerRoutes({required this.menuPages}) {
    for (var i = 0; i < menuPages.length; i++) {
      MenuPage menuPage = menuPages[i];
      _itemsMap[menuPage.url] = menuPage;
    }
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
