import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const logoImageUrl =
    'https://wg9r5td5e.tracktunes.org/assets/image/tracktunes-logo.png';

class TracktunesLogo extends StatelessWidget {
  final bool showText;

  const TracktunesLogo({
    Key? key,
    this.showText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Image.network(logoImageUrl, height: 80.0),
    ];

    if (showText) {
      children.addAll([
        const SizedBox(height: 8.0),
        Text('TRACKTUNES',
            style: GoogleFonts.blinker(
                fontSize: 24, fontWeight: FontWeight.w200, letterSpacing: 0))
      ]);
    }

    return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: children));
  }
}
