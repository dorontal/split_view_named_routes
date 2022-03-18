import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import './split_view.dart';
import '../classes/menu_page.dart';
import '../constants/menu_pages.dart';
import '../screens/first_page.dart';
import '../screens/second_page.dart';
import './tracktunes_logo.dart';

class SplitViewMenu extends StatelessWidget {
  final Widget? header;
  final List<MenuPage> menuPages;

  const SplitViewMenu({
    Key? key,
    this.header,
    required this.menuPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (header != null) {
      children
          .add(DrawerHeader(child: header, padding: const EdgeInsets.all(0.0)));
    }
    for (var menuPage in menuPages) {
      children.add(PageSelectorTile(menuPage: menuPage));
    }
    return Scaffold(body: ListView(children: children));
  }
}

class PageSelectorTile extends StatelessWidget {
  final MenuPage menuPage;

  const PageSelectorTile({
    Key? key,
    required this.menuPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = menuPage.url == ModalRoute.of(context)!.settings.name;
    final color =
        selected ? Theme.of(context).colorScheme.primary : Colors.white;
    return Material(
        color: Colors.transparent,
        child: ListTile(
          // show a check icon if the page is currently selected
          // note: we use Opacity to ensure that all tiles have a leading widget
          // and all the titles are left-aligned
          selected: selected,
          selectedTileColor: Colors.white10,
          leading: Icon(menuPage.menuIcon, color: color),
          title: Text(menuPage.menuText,
              style: TextStyle(color: color, fontSize: 16)),
          // onTap: () => Navigator.pushNamed(context, url),
          onTap: () {
            dev.log('tapped on ${menuPage.url}');
            Navigator.pushNamed(context, menuPage.url);
          },
        ));
  }
}
