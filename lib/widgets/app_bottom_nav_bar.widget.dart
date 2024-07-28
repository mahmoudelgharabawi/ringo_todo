import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_todo/module/calender/calender.page.dart';
import 'package:ringo_todo/module/project_summary/project_summary.page.dart';
import 'package:ringo_todo/utils/app.assets.dart';

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  const AppBottomNavBar({required this.selectedIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8,
            color: Colors.grey,
          )
        ],
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SizedBox(
        height: 88,
        child: Container(
          padding: const EdgeInsets.fromLTRB(35, 25, 35, 37),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => onTaped(0, context),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      AppAssets.all,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onTaped(1, context),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      selectedIndex == 1
                          ? AppAssets.selectedPs
                          : AppAssets.unSelectedPs,
                    ),
                  ),
                ),
              ),
              Container(
                width: 50,
              ),
              InkWell(
                onTap: () => onTaped(2, context),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      selectedIndex == 2
                          ? AppAssets.selectedCalender
                          : AppAssets.unSelectedCalender,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onTaped(3, context),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(39),
                      color: const Color(0xFFCDD2D3),
                      image: const DecorationImage(
                        image: AssetImage(
                          AppAssets.profile,
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTaped(int index, BuildContext context) {
    if (index == selectedIndex) return;
    switch (index) {
      case 0:
        // Navigate to Category screen
        break;
      case 1:
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProjectSummaryPage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ));

        break;
      case 2:
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CalenderPage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ));
        break;
      case 3:
        // Navigate to Memoji screen
        break;
    }
  }
}
