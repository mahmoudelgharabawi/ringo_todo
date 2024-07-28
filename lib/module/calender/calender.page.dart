import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/module/calender/widgets/bottom_sheet.widget.dart';
import 'package:ringo_todo/module/calender/widgets/schedule_item.widget.dart';
import 'package:ringo_todo/module/calender/widgets/task_item.widget.dart';
import 'package:ringo_todo/utils/app.assets.dart';
import 'package:ringo_todo/utils/app.colors.dart';
import 'package:ringo_todo/widgets/app_app_bar.dart';
import 'package:ringo_todo/widgets/app_bottom_nav_bar.widget.dart';
import 'package:ringo_todo/widgets/app_floating_action_button.widget.dart';
import 'package:intl/intl.dart' as intl;

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  late EasyInfiniteDateTimelineController _controller;
  DateTime _focusDate = DateTime.now();

  @override
  void initState() {
    _controller = _controller = EasyInfiniteDateTimelineController();
    super.initState();
  }

  void onChangeDay([bool forward = true]) {
    _focusDate = forward
        ? _focusDate.add(const Duration(days: 1))
        : _focusDate.subtract(const Duration(days: 1));
    _controller.animateToDate(_focusDate);
    setState(() {});
  }

  void showBottomSheet() async {
    var result = await showFlexibleBottomSheet(
      bottomSheetBorderRadius: const BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 1,
      context: context,
      builder: (ctx, _, __) => BottomSheetWidget(
        focusedDate: _focusDate,
      ),
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );

    if (result != null) {
      _focusDate = result;
      _controller.animateToDate(_focusDate);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f7f8),
        body: Column(
          children: [
            const AppAppBar(
              title: 'Calender',
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 14.7, 0),
                      child: Column(
                        children: [
                          EasyInfiniteDateTimeLine(
                            controller: _controller,
                            dayProps: const EasyDayProps(
                                height: 82,
                                width: 62,
                                inactiveDayStyle: DayStyle(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    dayStrStyle: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                        color: Colors.grey)),
                                activeDayStyle: DayStyle(
                                    dayStrStyle: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                        color: Colors.white)),
                                dayStructure: DayStructure.dayStrDayNum),
                            headerBuilder: (context, date) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: InkWell(
                                      onTap: () => showBottomSheet(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 11, 0),
                                            child: Text(
                                              intl.DateFormat.yMMM()
                                                  .format(_focusDate),
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                                height: 1.6,
                                                letterSpacing: -0.4,
                                                color: Color(0xFF191D2B),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 8, 0, 15),
                                            width: 16,
                                            height: 16,
                                            child: SvgPicture.asset(
                                              AppAssets.downArrow,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () => onChangeDay(false),
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 8, 0),
                                          width: 35,
                                          height: 35,
                                          padding: EdgeInsets.fromLTRB(
                                              11.8, 9.2, 12.5, 9.2),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFFE8EAEE)),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: SizedBox(
                                            width: 4.7,
                                            height: 10.6,
                                            child: SvgPicture.asset(
                                              AppAssets.leftArrow,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => onChangeDay(),
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          padding: const EdgeInsets.fromLTRB(
                                              12.4, 9.2, 11.8, 9.2),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFFE8EAEE)),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: SizedBox(
                                            width: 4.7,
                                            height: 10.6,
                                            child: SvgPicture.asset(
                                              AppAssets.rightArrow,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                            activeColor: AppColors.mainColor,
                            firstDate: DateTime(2024),
                            focusDate: _focusDate,
                            lastDate: DateTime(2026, 12, 31),
                            onDateChange: (selectedDate) {
                              setState(() {
                                _focusDate = selectedDate;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          TabBar(
                              labelColor: AppColors.mainColor,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: AppColors.mainColor,
                              indicatorSize: TabBarIndicatorSize.tab,
                              dividerColor: Colors.transparent,
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Schedule',
                                    style: GoogleFonts.getFont(
                                      'Urbanist',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      height: 1.6,
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Task',
                                    style: GoogleFonts.getFont(
                                      'Urbanist',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      height: 1.6,
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [scheduleWidget, taskWidget]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const AppBottomNavBar(
          selectedIndex: 2,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const AppFloatingActionButtonWidget());
  }

  Widget get scheduleWidget => Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              ScheduleItemWidget(
                time: '09:00',
                itemBuilder: () => Container(
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F1FB),
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(width: 7, color: Color(0xffcf8cdf)),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 26.1, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              'Sprint Review Period 02 in May 2022',
                              style: GoogleFonts.getFont(
                                'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1.4,
                                letterSpacing: -0.1,
                                color: Color(0xFF191D2B),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(1.3, 0, 1.3, 0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(0, 1.3, 9.3, 1.3),
                                    width: 16,
                                    height: 16,
                                    child: SizedBox(
                                      width: 13.3,
                                      height: 13.3,
                                      child: SvgPicture.asset(
                                        AppAssets.timeCircle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '09:00 AM - 10:00 AM',
                                    style: GoogleFonts.getFont(
                                      'Urbanist',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      height: 1.3,
                                      letterSpacing: -0.1,
                                      color: Color(0xFF96A0B5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ScheduleItemWidget(
                time: '10:00',
              ),
              ScheduleItemWidget(
                time: '10:40',
                color: AppColors.mainColor,
              ),
              ScheduleItemWidget(
                time: '11:00',
                itemBuilder: () => Container(
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFFEDFCC),
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(width: 7, color: Color(0xfffd7722)),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 12, 0, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 6.3, 4),
                          child: Text(
                            'Meeting with Client',
                            style: GoogleFonts.getFont(
                              'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 1.4,
                              letterSpacing: -0.1,
                              color: Color(0xFF191D2B),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1.3, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 1.3, 9.3, 1.3),
                                width: 16,
                                height: 16,
                                child: SizedBox(
                                  width: 13.3,
                                  height: 13.3,
                                  child: SvgPicture.asset(
                                    AppAssets.timeCircle,
                                  ),
                                ),
                              ),
                              Text(
                                '11:00 AM - 12:00 AM',
                                style: GoogleFonts.getFont(
                                  'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: -0.1,
                                  color: Color(0xFF96A0B5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ScheduleItemWidget(
                time: '12:00',
                itemBuilder: () => Container(
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFEBF9F5),
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(width: 7, color: Color(0xff5dceb3)),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 12, 0, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Daily Standup',
                              style: GoogleFonts.getFont(
                                'Urbanist',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1.4,
                                letterSpacing: -0.1,
                                color: Color(0xFF191D2B),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1.3, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 1.3, 9.3, 1.3),
                                width: 16,
                                height: 16,
                                child: SizedBox(
                                  width: 13.3,
                                  height: 13.3,
                                  child: SvgPicture.asset(
                                    AppAssets.timeCircle,
                                  ),
                                ),
                              ),
                              Text(
                                '12:00 AM - 12:30 PM',
                                style: GoogleFonts.getFont(
                                  'Urbanist',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: -0.1,
                                  color: Color(0xFF96A0B5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ScheduleItemWidget(
                time: '13:00',
              ),
            ],
          ),
        ),
      );

  Widget get taskWidget => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: Colors.white,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              TaskItemWidget(
                title: 'Meeting Concept',
                desc: 'Due Date : Mon, 12 Jan 2023',
              ),
              TaskItemWidget(
                title: 'Information Architecture',
                desc: 'Due Date : Mon, 12 Jan 2023',
              ),
              TaskItemWidget(
                title: 'Monitoring Project',
                desc: 'Due Date : Mon, 12 Jan 2023',
              ),
              TaskItemWidget(
                title: 'Daily Standup',
                desc: 'Due Date : Mon, 12 Jan 2023',
              ),
            ],
          ),
        ),
      );
}
