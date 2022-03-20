import 'package:flutter/material.dart';
import '../constants/header_url.dart';
import './tracktunes_logo.dart';

class AppMenuHeader extends StatelessWidget {
  const AppMenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: InkWell(
      onTap: () {
        final currentPath = ModalRoute.of(context)!.settings.name;
        if (currentPath != headerUrl) {
          Navigator.pushNamed(context, headerUrl);
        }
      },
      child: const TracktunesLogo(),
    ));
  }
}
