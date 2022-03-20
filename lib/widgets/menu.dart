import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../classes/menu_page.dart';

/// Reusable menu
class Menu extends ConsumerWidget {
  final Widget? header;
  final List<MenuPage> menuPages;
  final List<Function>? lowerMenuBuilders;

  const Menu({
    Key? key,
    this.header,
    required this.menuPages,
    this.lowerMenuBuilders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = <Widget>[];

    if (header != null) {
      children.addAll([header!, const Divider()]);
    }

    for (var menuPage in menuPages) {
      children.add(PageSelectionTile(menuPage: menuPage, menuPages: menuPages));
    }

    if (lowerMenuBuilders != null) {
      children.add(const Divider());
      children.addAll(lowerMenuBuilders!.map((f) => f(context, ref)));
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
              if (!selected) {
                if (menuPage.menuAction != null) {
                  menuPage.menuAction!(context);
                } else {
                  Navigator.pushNamed(context, menuPage.url!);
                }
              }
            }));
  }
}
