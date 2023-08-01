import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultText extends StatelessWidget {
  const ResultText({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: GoogleFonts.lato(color: color),
      ),
    );
  }
}
