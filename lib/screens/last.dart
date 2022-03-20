import 'package:flutter/material.dart';
import '../widgets/split_view_scaffold.dart';

class Last extends StatelessWidget {
  const Last({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitViewScaffold(
        title: 'Last Page',
        body: Center(
          child:
              Text('Last Page', style: Theme.of(context).textTheme.headline4),
        ));
  }
}
