import 'package:flutter/material.dart';
import '../widgets/split_view_scaffold.dart';
import '../widgets/tracktunes_logo.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SplitViewScaffold(
      title: 'About', body: Center(child: TracktunesLogo(showText: true)));
}
