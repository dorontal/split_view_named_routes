/*
Copyright (c) 2019 Andrea Bizzotto bizz84@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// Minor modifications by Doron Tal

import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import './split_view.dart';
import './first_page.dart';
import './second_page.dart';

Widget _makeSplitViewPage(Widget page) => SplitView(
      menu: const AppMenu(),
      content: page,
    );

// a map of ("page name", WidgetBuilder) pairs
final appRoutes = <String, WidgetBuilder>{
  'page1': (_) => _makeSplitViewPage(const FirstPage()),
  'page2': (_) => _makeSplitViewPage(const SecondPage()),
};

// 1. extend from ConsumerWidget
class AppMenu extends StatelessWidget {
  const AppMenu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for (var pageRoutePath in appRoutes.keys)
            PageListTile(
                // 3. pass the selectedpageRoutePath as an argument
                pageRoutePath: pageRoutePath),
        ],
      ),
    );
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
    final selectedpageRoutePath = ModalRoute.of(context)!.settings.name;
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      leading: Opacity(
        opacity: selectedpageRoutePath == pageRoutePath ? 1.0 : 0.0,
        child: const Icon(Icons.check),
      ),
      title: Text(pageRoutePath),
      // onTap: () => Navigator.pushNamed(context, pageRoutePath),
      onTap: () {
        dev.log('tapped on $pageRoutePath');
        Navigator.pushNamed(context, pageRoutePath);
      },
    );
  }
}
