import 'package:flutter/material.dart';
import '../constants/header_url.dart';
import './tracktunes_logo.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({Key? key}) : super(key: key);

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
