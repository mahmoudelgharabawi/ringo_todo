import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButtonWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  const SocialButtonWidget(
      {required this.title, required this.svgPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8EAEE)),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/vectors/$svgPath',
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.getFont(
                      'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 1.5,
                      letterSpacing: -0.3,
                      color: const Color(0xFF191D2B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
