import 'package:flutter/material.dart';
import '../classes/menu_page.dart';

class AppMenu extends StatelessWidget {
  final Widget? header;
  final List<MenuPage> menuPages;

  const AppMenu({Key? key, this.header, required this.menuPages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (header != null) {
      children.add(header!);
    }

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
            title: Text(menuPage.menuText!,
                style: TextStyle(color: color, fontSize: 16)),
            onTap: () {
              Navigator.pushNamed(context, menuPage.url);
            }));
  }
}
