import 'package:flutter/material.dart';

class MenuPage {
  final Widget page;
  final String url;
  final IconData? menuIcon;
  final String? menuText;
  final Function? menuAction;

  MenuPage({
    required this.page,
    required this.url,
    this.menuIcon,
    this.menuText,
    this.menuAction,
  });
}

/// Reusable menu class to fill a drawer or a left side column of the app
class Menu extends StatelessWidget {
  final Widget? header;
  final List<MenuPage> menuPages;
  final List<MenuPage>? menuPages2;

  const Menu({
    Key? key,
    this.header,
    required this.menuPages,
    this.menuPages2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (header != null) {
      children.add(header!);
    }

    for (var menuPage in menuPages) {
      children.add(PageSelectionTile(menuPage: menuPage, menuPages: menuPages));
    }

    if (menuPages2 != null) {
      children.add(const Divider());
      for (var menuPage in menuPages2!) {
        children
            .add(PageSelectionTile(menuPage: menuPage, menuPages: menuPages));
      }
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
