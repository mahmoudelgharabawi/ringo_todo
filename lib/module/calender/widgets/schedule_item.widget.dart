import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleItemWidget extends StatelessWidget {
  final String time;
  final Widget Function()? itemBuilder;
  final Color? color;
  const ScheduleItemWidget(
      {required this.time, this.itemBuilder, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 0, 24, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 25, 56),
            child: Text(
              time,
              style: GoogleFonts.getFont(
                'Urbanist',
                fontWeight: color != null ? FontWeight.w700 : FontWeight.w500,
                fontSize: 12,
                height: 1.3,
                letterSpacing: -0.1,
                color: Color(0xFF191D2B),
              ),
            ),
          ),
          itemBuilder == null
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 7),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color ?? Color(0xFFE8EAEE),
                      ),
                      child: Container(
                        height: 1,
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: color ?? Color(0xFFE8EAEE),
                        ),
                        height: 1,
                      ),
                      itemBuilder!.call()
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
