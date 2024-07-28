import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/utils/app.assets.dart';

class AppAppBar extends StatelessWidget {
  final String title;
  const AppAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 14.7, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              AppAssets.menu,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          title,
                          style: GoogleFonts.getFont(
                            'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 1.5,
                            letterSpacing: -0.3,
                            color: Color(0xFF191D2B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE8EAEE)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(6.5, 6.5, 6.5, 6.5),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                AppAssets.notification,
                              ),
                            ),
                          ),
                          Positioned(
                            right: -2.5,
                            top: -1.5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFDD4A4A),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                width: 12,
                                height: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
