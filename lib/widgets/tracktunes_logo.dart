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

// Thick:
// Text('TRACKTUNES', style: GoogleFonts.caveatBrush(
// Text('TRACKTUNES', style: GoogleFonts.chewy(
// Text('TRACKTUNES', style: GoogleFonts.londrinaSolid(
// Text('TRACKTUNES', style: GoogleFonts.jua(
// Text('TRACKTUNES', style: GoogleFonts.balooThambi(

// Thin:
// Text('TRACKTUNES', style: GoogleFonts.cousine(
// Text('TRACKTUNES', style: GoogleFonts.cambay(
// Text('TRACKTUNES', style: GoogleFonts.overlock(
// Text('TRACKTUNES', style: GoogleFonts.darkerGrotesque(
// Text('TRACKTUNES', style: GoogleFonts.montserrat(
// Text('TRACKTUNES', style: GoogleFonts.syncopate(
// Text('TRACKTUNES', style: GoogleFonts.amiko(
// Text('TRACKTUNES', style: GoogleFonts.rambla(
// Text('TRACKTUNES', style: GoogleFonts.beVietnam(
// Text('TRACKTUNES', style: GoogleFonts.miriamLibre(
// Text('TRACKTUNES', style: GoogleFonts.blinker(
// Text('TRACKTUNES', style: GoogleFonts.fresca(
// Text('TRACKTUNES', style: GoogleFonts.niramit(

// Italic:
// Text('TRACKTUNES', style: GoogleFonts.damion(
// Text('TRACKTUNES', style: GoogleFonts.knewave(
// Text('TRACKTUNES', style: GoogleFonts.contrailOne(

// Funky:
// Text('TRACKTUNES', style: GoogleFonts.itim(
// Text('TRACKTUNES', style: GoogleFonts.averiaLibre(
// Text('TRACKTUNES', style: GoogleFonts.lilyScriptOne(
// Text('TRACKTUNES', style: GoogleFonts.dekko(
