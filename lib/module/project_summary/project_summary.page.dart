import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/module/project_summary/widgets/productivity_item.widget.dart';
import 'package:ringo_todo/module/project_summary/widgets/projects_summary.widget.dart';
import 'package:ringo_todo/utils/app.assets.dart';
import 'package:ringo_todo/utils/app.colors.dart';
import 'package:ringo_todo/widgets/app_app_bar.dart';
import 'package:ringo_todo/widgets/app_bottom_nav_bar.widget.dart';
import 'package:ringo_todo/widgets/app_floating_action_button.widget.dart';
import 'package:ringo_todo/widgets/app_text_field.widget.dart';

class ProjectSummaryPage extends StatefulWidget {
  const ProjectSummaryPage({super.key});

  @override
  State<ProjectSummaryPage> createState() => _ProjectSummaryPageState();
}

class _ProjectSummaryPageState extends State<ProjectSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f7f8),
        body: Column(
          children: [
            const AppAppBar(
              title: 'Project Summary',
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 14.7, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextFieldWidget(
                            enabled: false,
                            label: 'Search',
                            hint: 'Search project here',
                            suffixIcon: SvgPicture.asset(
                              AppAssets.search,
                            ),
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: ProjectSummaryWidgets(
                                colors: [Color(0xFF3A9ADE), Color(0xFF5EACE4)],
                                label: '10',
                                svgPath: 'vector_15_x2.svg',
                                projectStatus: 'Project In Progress',
                              )),
                              Expanded(
                                  child: ProjectSummaryWidgets(
                                colors: [Color(0xFF3F8B8D), Color(0xFF58B2B4)],
                                label: '20',
                                svgPath: 'vector_7_x2.svg',
                                projectStatus: 'Project Completed',
                              )),
                              Expanded(
                                  child: ProjectSummaryWidgets(
                                colors: [Color(0xFFDD4A4A), Color(0xFFE87777)],
                                label: '5',
                                svgPath: 'vector_32_x2.svg',
                                projectStatus: 'Project Cancelled',
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'View All Project',
                                style: GoogleFonts.getFont(
                                  'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  height: 1.4,
                                  letterSpacing: -0.1,
                                  color: Color(0xFF191D2B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 0, 14.7, 0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Productivity',
                                  style: GoogleFonts.getFont(
                                    'Urbanist',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    height: 1.6,
                                    letterSpacing: -0.4,
                                    color: Color(0xFF191D2B),
                                  ),
                                ),
                                const Icon(Icons.more_horiz)
                              ],
                            ),
                          ),
                          const Row(
                            children: [
                              ProductivityItemWidget(
                                month: 'Jan',
                                height: 107,
                              ),
                              ProductivityItemWidget(
                                month: 'Feb',
                                height: 138,
                              ),
                              ProductivityItemWidget(
                                month: 'Mar',
                                height: 80,
                              ),
                              ProductivityItemWidget(
                                showBadge: true,
                                month: 'Apr',
                                height: 102,
                                colorEx: AppColors.mainColor,
                              ),
                              ProductivityItemWidget(
                                month: 'May',
                                height: 127,
                              ),
                              ProductivityItemWidget(
                                month: 'Jun',
                                height: 133,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const AppBottomNavBar(
          selectedIndex: 1,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const AppFloatingActionButtonWidget());
  }
}
