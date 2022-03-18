import 'package:flutter/material.dart';
import '../widgets/split_view_scaffold.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplitViewScaffold(
      title: 'Second Page',
      body: Center(
        child:
            Text('Second Page', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}