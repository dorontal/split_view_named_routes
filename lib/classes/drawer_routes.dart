import 'package:flutter/material.dart';
import 'package:split_view_named_routes/widgets/split_view.dart';
import 'package:split_view_named_routes/widgets/tracktunes_logo.dart';
import '../widgets/split_view_menu.dart';
import 'menu_page.dart';

class DrawerRoutes {
  final List<MenuPage> menuPages;

  late final Map<String, Widget> _itemsMap;
  String lastRouteUrl = '/';

  DrawerRoutes({required this.menuPages}) {
    _itemsMap = {};
    for (var i = 0; i < menuPages.length; i++) {
      MenuPage menuPage = menuPages[i];
      _itemsMap[menuPage.url] = menuPage.page;
    }
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name != null);
    MenuPage menuPage = settings.name == '/'
        ? menuPages[0]
        : _itemsMap[settings.name] as MenuPage;
    lastRouteUrl = settings.name!;
    return MaterialPageRoute(
        // passing settings is what sets the URL to the current route
        settings: settings,
        builder: (context) => SplitView(
            menu: SplitViewMenu(
              menuPages: menuPages,
              header: const TracktunesLogo(),
            ),
            content: menuPage.page));
  }
}
