import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import './split_view.dart';
import '../classes/split_view_page.dart';
import '../constants/menu_pages.dart';
import '../screens/first_page.dart';
import '../screens/second_page.dart';
import './tracktunes_logo.dart';

Widget _makeSplitViewPage(Widget page) => SplitView(
      menu: SplitViewMenu(header: const TracktunesLogo(), menuPages: menuPages),
      content: page,
    );

// a map of ("page name", WidgetBuilder) pairs
final appRoutes = <String, WidgetBuilder>{
  'page1': (_) => _makeSplitViewPage(const FirstPage()),
  'page2': (_) => _makeSplitViewPage(const SecondPage()),
};

// 1. extend from ConsumerWidget
class SplitViewMenu extends StatelessWidget {
  final Widget? header;
  final List<SplitViewPage> menuPages;

  const SplitViewMenu({
    Key? key,
    this.header,
    required this.menuPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: ListView(
        children: <Widget>[
          for (var menuPage in menuPages) PageSelectorTile(menuPage: menuPage)
        ],
      ));
}

class PageSelectorTile extends StatelessWidget {
  final SplitViewPage menuPage;

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
          title: Text(menuPage.menuText!,
              style: TextStyle(color: color, fontSize: 16)),
          // onTap: () => Navigator.pushNamed(context, url),
          onTap: () {
            dev.log('tapped on ${menuPage.url}');
            Navigator.pushNamed(context, menuPage.url!);
          },
        ));
  }
}
