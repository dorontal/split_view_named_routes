import 'package:flutter/material.dart';
import '../services/app_router.dart';
import '../widgets/tracktunes_logo.dart';

class AppMenu extends StatelessWidget {
  final List<MenuPage> menuPages;

  const AppMenu({Key? key, required this.menuPages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    children.add(DrawerHeader(
        child: InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, 'header');
      },
      child: const TracktunesLogo(),
    )));

    for (var menuPage in menuPages) {
      children.add(PageSelectionTile(menuPage: menuPage, menuPages: menuPages));
    }

    return Scaffold(body: ListView(children: children));
  }
}

class PageSelectionTile extends StatelessWidget {
  final MenuPage menuPage;
  final List<MenuPage> menuPages;

  const PageSelectionTile(
      {Key? key, required this.menuPage, required this.menuPages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPath = ModalRoute.of(context)!.settings.name;
    final selected =
        menuPage.url == (currentPath == '/' ? menuPages[0].url : currentPath);
    final color =
        selected ? Theme.of(context).colorScheme.primary : Colors.white;

    return Material(
        color: Colors.transparent,
        child: ListTile(
            selected: selected,
            selectedTileColor: Colors.white10,
            leading: Icon(menuPage.menuIcon, color: color),
            title: Text(menuPage.menuText,
                style: TextStyle(color: color, fontSize: 16)),
            onTap: () {
              Navigator.pushNamed(context, menuPage.url);
            }));
  }
}
