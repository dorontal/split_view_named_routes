import 'package:flutter/material.dart';
import '../widgets/split_view_scaffold.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitViewScaffold(
        title: 'About Page',
        body: Center(
          child:
              Text('About Page', style: Theme.of(context).textTheme.headline4),
        ));
  }
}
