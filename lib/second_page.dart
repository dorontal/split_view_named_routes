import 'package:flutter/material.dart';
import './page_scaffold.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Second Page',
      body: Center(
        child:
            Text('Second Page', style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
