/*
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import '../classes/split_view_page.dart';

/// Widget that becomes a Drawer widget tucked behind the app if the screen
/// is too small or the left column when the screen is wide enough.
class SplitViewMenu extends StatelessWidget {
  final Widget? header;
  final List<SplitViewPage> menuPages;

  const SplitViewMenu({
    Key? key,
    this.header,
    required this.menuPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for (var menuPage in menuPages) PageListTile(url: menuPage.url!)
        ],
      ),
    );
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    final selectedurl = ModalRoute.of(context)!.settings.name;
    final selectedPageRoutePath = ModalRoute.of(context)!.settings.name;
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      selected: selectedPageRoutePath == pageRoutePath,
      /*
      leading: Opacity(
        opacity: selectedPageRoutePath == pageRoutePath ? 1.0 : 0.0,
        child: const Icon(Icons.check),
      ),
      */
      title: Text(pageRoutePath),
      // onTap: () => Navigator.pushNamed(context, pageRoutePath),
      onTap: () {
        dev.log('tapped on $pageRoutePath');
        Navigator.pushNamed(context, pageRoutePath);
      },
    );
  }
}


*/

import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import './split_view.dart';
import '../classes/split_view_page.dart';
import '../constants/menu_pages.dart';
import '../screens/first_page.dart';
import '../screens/second_page.dart';
import './tracktunes_logo.dart';

Widget _makeSplitViewPage(Widget page) => SplitView(
      menu: const SplitViewMenu(header: TracktunesLogo()),
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
  Widget build(BuildContext context) {
    final List<Widget> children = header == null ? [] : [header!];
    children.addAll([
      for (var pageRoutePath in appRoutes.keys)
        PageListTile(
            // 3. pass the selectedPageRoutePath as an argument
            pageRoutePath: pageRoutePath),
    ]);
    return Scaffold(body: ListView(children: children));
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
    Key? key,
    required this.pageRoutePath,
  }) : super(key: key);
  final String pageRoutePath;
  @override
  Widget build(BuildContext context) {
    final selectedPageRoutePath = ModalRoute.of(context)!.settings.name;
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      selected: selectedPageRoutePath == pageRoutePath,
      /*
      leading: Opacity(
        opacity: selectedPageRoutePath == pageRoutePath ? 1.0 : 0.0,
        child: const Icon(Icons.check),
      ),
      */
      title: Text(pageRoutePath),
      // onTap: () => Navigator.pushNamed(context, pageRoutePath),
      onTap: () {
        dev.log('tapped on $pageRoutePath');
        Navigator.pushNamed(context, pageRoutePath);
      },
    );
  }
}
