import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/utils/app.assets.dart';

class TaskItemWidget extends StatelessWidget {
  final String title;
  final String desc;
  const TaskItemWidget({required this.title, required this.desc, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(4, 8),
            blurRadius: 12,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 18, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: GoogleFonts.getFont(
                        'Urbanist',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.5,
                        letterSpacing: -0.3,
                        color: Color(0xFF191D2B),
                      ),
                    ),
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.getFont(
                    'Urbanist',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.3,
                    letterSpacing: -0.1,
                    color: Color(0xFF697896),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              width: 24,
              height: 24,
              child: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  AppAssets.checkTask,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
