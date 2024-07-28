import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ringo_todo/utils/app.assets.dart';
import 'package:ringo_todo/utils/app.colors.dart';
import 'package:ringo_todo/widgets/app_elevated_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart' as intl;

class BottomSheetWidget extends StatefulWidget {
  final DateTime focusedDate;
  const BottomSheetWidget({required this.focusedDate, super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  var charList = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  late DateTime _focusDate;
  @override
  void initState() {
    _focusDate = widget.focusedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Choose Date',
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
                ],
              ),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.mainColor,
                            )),
                      ))),
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 16, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: charList
                        .map(
                          (e) => Text(
                            e,
                            style: GoogleFonts.getFont(
                              'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1.5,
                              letterSpacing: -0.3,
                              color: Color(0xFF191D2B),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                TableCalendar(
                  headerStyle: HeaderStyle(
                      leftChevronIcon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        width: 24,
                        height: 24,
                        child: SizedBox(
                          width: 7.1,
                          height: 15.8,
                          child: SvgPicture.asset(
                            AppAssets.leftCalenderArrow,
                          ),
                        ),
                      ),
                      rightChevronPadding: EdgeInsets.zero,
                      leftChevronMargin: EdgeInsets.zero,
                      rightChevronIcon: Container(
                        margin: const EdgeInsets.fromLTRB(0, 4.1, 0, 4.1),
                        width: 24,
                        height: 24,
                        child: SizedBox(
                          width: 7.1,
                          height: 15.8,
                          child: SvgPicture.asset(
                            AppAssets.rightCalenderArrow,
                          ),
                        ),
                      ),
                      titleTextStyle: GoogleFonts.getFont(
                        'Urbanist',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.5,
                        letterSpacing: -0.3,
                        color: const Color(0xFF191D2B),
                      ),
                      titleTextFormatter: (date, locale) =>
                          intl.DateFormat.yMMM().format(date),
                      titleCentered: true,
                      formatButtonVisible: false),
                  calendarBuilders: CalendarBuilders(
                    todayBuilder: (context, day, focusedDay) => Center(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.mainColor, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${day.day}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  currentDay: _focusDate,
                  daysOfWeekVisible: false,
                  // headerVisible: false,
                  firstDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusDate,
                  onDaySelected: (date1, date2) {
                    setState(() {});
                    _focusDate = date1;
                  },
                )
              ],
            ),
          ),
        ),
        const Divider(),
        SizedBox(
          height: 100,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AppElevatedButton(
                  onPressed: () => Navigator.pop(context, _focusDate),
                  label: 'Continue'),
            ),
          ),
        )
      ],
    );
  }
}
