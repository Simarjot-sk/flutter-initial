import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zumi_app/ui/features/my_profile/profile_view_model.dart';
import 'package:zumi_app/ui/theme/colors.dart';

class SetAvailableTimeAndDate extends StatefulWidget {
  static const String route = "SetAvailableTimeAndDate";
  const SetAvailableTimeAndDate({Key? key}) : super(key: key);

  @override
  State<SetAvailableTimeAndDate> createState() =>
      _SetAvailableTimeAndDateState();
}

class _SetAvailableTimeAndDateState extends State<SetAvailableTimeAndDate> {
  @override
  void initState() {
    context.read<ProfileViewModel>().setTime();
    super.initState();
  }

  static DateTime _focusDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProfileViewModel>(context);
    return SafeArea(
      child: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: ColoredBox(
            color: AppColors.white,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyDarkFont.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 8,
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        CupertinoIcons.arrow_left,
                        color: AppColors.blackDarkFont,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                rating(),
                const SizedBox(height: 15),
                selectDate(context),
                const SizedBox(height: 15),
                selectAvailableTime(prov),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rating() => Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rate',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 17,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    color: AppColors.greenDark,
                  ),
                ),
                SvgPicture.asset('assets/icons/edit_icon.svg'),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                for (int u = 0; u < 4; u++)
                  Container(
                    height: 90,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyDarkFont.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'One Hour\nHome Visit',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: Color(0xffE9985D),
                          ),
                        ),
                        Text(
                          '£15',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: AppColors.greenDark,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            )
          ],
        ),
      );

  Widget selectDate(context) => Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Date',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 17,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    color: AppColors.greenDark,
                  ),
                ),
                Text(
                  '${DateFormat('MMMM yyyy').format(_focusDay)}',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 17,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    color: Color(0xffE9985D),
                  ),
                ),
              ],
            ),
            const Divider(),
            Card(
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusDay,
                currentDay: _focusDay,
                calendarStyle: const CalendarStyle(isTodayHighlighted: true),
                calendarFormat: CalendarFormat.week,
                onDaySelected: (date, time) {
                  debugPrint(date.toString());
                  debugPrint(time.day.toString());
                  setState(() {
                    _focusDay = date;
                    debugPrint(_focusDay.toString());
                  });
                },
                headerVisible: false,
              ),
            )
          ],
        ),
      );

  Widget selectAvailableTime(ProfileViewModel prov) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Select Available Time',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 17,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: AppColors.greenDark,
                ),
              ),
              CupertinoSwitch(
                value: prov.isPlanSelect,
                onChanged: (bool val) {
                  prov.changeStatusAvailTime();
                },
              ),
            ],
          ),
          for (int p = 0; p < prov.showTimeList.length; p++)
            prov.isPlanSelect
                ? Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 1,
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prov.showTimeList[p].day!,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            color: AppColors.orange,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  prov.showTimeList[p].fromTime!,
                                  style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackDarkFont,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'To',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackDarkFont
                                        .withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  prov.showTimeList[p].toTime!,
                                  style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackDarkFont,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: editTimeSheet,
                              child: SvgPicture.asset(
                                  'assets/icons/edit_icon.svg'),
                            ),
                            CupertinoSwitch(
                              value: prov.showTimeList[p].status!,
                              onChanged: (bool val) {
                                setState(() {
                                  prov.showTimeList[p].status =
                                      !prov.showTimeList[p].status!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Future<void> editTimeSheet() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 700,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
