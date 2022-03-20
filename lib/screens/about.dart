import 'package:flutter/material.dart';
import '../widgets/split_view_scaffold.dart';
import '../widgets/tracktunes_logo.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SplitViewScaffold(
      title: 'Header', body: Center(child: TracktunesLogo(showText: true)));
}
