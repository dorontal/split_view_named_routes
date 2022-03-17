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
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
          for (var menuPage in menuPages) PageSelectorTile(url: menuPage.url!)
        ],
      );
}

class PageSelectorTile extends StatelessWidget {
  final String url;

  const PageSelectorTile({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      selected: url == ModalRoute.of(context)!.settings.name,
      title: Text(url),
      // onTap: () => Navigator.pushNamed(context, url),
      onTap: () {
        dev.log('tapped on $url');
        Navigator.pushNamed(context, url);
      },
    );
  }
}
