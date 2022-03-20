import 'package:flutter/material.dart';
import '../widgets/split_view_scaffold.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplitViewScaffold(
        title: 'Header Page',
        body: Center(
          child:
              Text('Header Page', style: Theme.of(context).textTheme.headline4),
        ));
  }
}
