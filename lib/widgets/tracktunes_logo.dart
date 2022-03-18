import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const logoImageUrl =
    'https://wg9r5td5e.tracktunes.org/assets/image/tracktunes-logo.png';

class TracktunesLogo extends StatelessWidget {
  const TracktunesLogo({Key? key, this.showText = true}) : super(key: key);

  final bool showText;

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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: children));
  }
}
