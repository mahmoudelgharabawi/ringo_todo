import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/utils/app.assets.dart';

class ProductivityItemWidget extends StatelessWidget {
  final String month;
  final double height;
  final Color? colorEx;
  final bool showBadge;
  const ProductivityItemWidget(
      {super.key,
      this.showBadge = false,
      this.colorEx,
      required this.month,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        child: Stack(
          children: [
            if (showBadge)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF191D2B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                      child: RichText(
                        text: TextSpan(
                          text: '56 ',
                          style: GoogleFonts.getFont(
                            'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFFFFFFFF),
                          ),
                          children: [
                            TextSpan(
                              text: '%',
                              style: GoogleFonts.getFont(
                                'Urbanist',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                    child: SizedBox(
                      width: 16,
                      height: 5,
                      child: SvgPicture.asset(
                        AppAssets.smallDownArrow,
                      ),
                    ),
                  ),
                ],
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 31, 8, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorEx,
                      gradient: colorEx != null
                          ? null
                          : const LinearGradient(
                              begin: Alignment(-1.162, 0.008),
                              end: Alignment(1.176, 0.008),
                              colors: <Color>[
                                Color(0xffe7e7e8),
                                Color(0xffeeefef)
                              ],
                              stops: <double>[0, 1],
                            ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Container(
                      height: height,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(month,
                    style: GoogleFonts.getFont(
                      'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      height: 1.4,
                      letterSpacing: -0.1,
                      color: Color(0xFF96A0B5),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
