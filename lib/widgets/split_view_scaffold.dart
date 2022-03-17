import 'package:flutter/material.dart';

/// Use this scaffold instead of a regular Scaffold when the page using this
/// scaffold is inside a SplitView, so that the leading menu button of this
/// scaffold shows up only when the split-view is the large-screen (two-column)
/// view and when the split-view is in small-screen mode (one-column) then this
/// scaffold will show a leading menu (hamburger) icon.
class SplitViewScaffold extends StatelessWidget {
  const SplitViewScaffold({
    Key? key,
    required this.title,
    this.actions = const [],
    this.body,
    this.floatingActionButton,
  }) : super(key: key);
  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    // 1. look for an ancestor Scaffold
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: AppBar(
        // 3. add a non-null leading argument if we have a drawer
        leading: hasDrawer
            ? IconButton(
                icon: const Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold.openDrawer() : null,
              )
            : null,
        title: Text(title),
        actions: actions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
