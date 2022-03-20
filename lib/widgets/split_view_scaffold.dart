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

// Minor changes by Doron Tal

import 'package:flutter/material.dart';

/// Use this scaffold instead of a regular Scaffold when the page using this
/// scaffold is inside a SplitView, so that the leading menu button of this
/// scaffold shows up only when the split-view is the large-screen (two-column)
/// view and when the split-view is in small-screen mode (one-column) then this
/// scaffold will show a leading menu (hamburger) icon.
class SplitViewScaffold extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;

  const SplitViewScaffold({
    Key? key,
    required this.title,
    this.actions = const [],
    this.body,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
        appBar: AppBar(
            leading: hasDrawer
                ? IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => ancestorScaffold.openDrawer())
                : null,
            title: Text(title),
            actions: actions),
        body: body,
        floatingActionButton: floatingActionButton);
  }
}
