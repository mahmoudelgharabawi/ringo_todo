import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectSummaryWidgets extends StatelessWidget {
  final List<Color> colors;
  final String label;
  final String projectStatus;
  final String svgPath;
  const ProjectSummaryWidgets(
      {required this.colors,
      required this.label,
      required this.svgPath,
      required this.projectStatus,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: colors[1].withOpacity(0.5),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              gradient: RadialGradient(
                center: const Alignment(-0.575, -0.471),
                radius: 0.85,
                colors: colors,
                stops: const <double>[0, 1],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 17.3, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                          child: Text(
                            label,
                            style: GoogleFonts.getFont(
                              'Urbanist',
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              height: 1.2,
                              letterSpacing: -0.5,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 7.3, 0, 7.3),
                          width: 16,
                          height: 16,
                          child: SizedBox(
                            width: 13.3,
                            height: 13.3,
                            child: SvgPicture.asset(
                              'assets/vectors/$svgPath',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      projectStatus,
                      style: GoogleFonts.getFont(
                        'Urbanist',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1.3,
                        letterSpacing: -0.1,
                        color: const Color(0xCCFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
