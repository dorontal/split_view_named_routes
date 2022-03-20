import 'package:flutter/material.dart';
import '../widgets/split_view_scaffold.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitViewScaffold(
        title: 'First Page',
        body: Center(
          child:
              Text('First Page', style: Theme.of(context).textTheme.headline4),
        ));
  }
}
