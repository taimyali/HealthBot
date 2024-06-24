import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class MyTabBar extends StatelessWidget {
  MyTabBar({super.key});

  final List<String> morning = [
    'Morning Yoga',
    'Breakfast with family',
    'Read a book',
    'Morning meeting'
  ];
  final List<String> day = [
    'Work on project',
    'Team lunch',
    'Client call',
    'Code review'
  ];
  final List<String> night = [
    'Dinner with family',
    'Evening walk',
    'Watch a movie',
    'Plan for next day'
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 45.h,
            child: TabBar(
                overlayColor: WidgetStateProperty.all(secondaryColor),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Creates border
                    color: secondaryColor), //Cha
                dividerColor: Colors.transparent,
                // splashBorderRadius: BorderRadius.circular(28),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: secondaryColor,
                tabs: [
                  Tab(
                    icon: Text(
                      'Morning',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Day',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Night',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: TabBarView(children: [
              // morning
              Column(
                children: morning
                    .map((task) => Row(
                          children: [
                            const Icon(
                              EvaIcons.checkmark_circle,
                              color: themecolor,
                            ),
                            8.h.horizontalSpace,
                            Text(
                              task,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ))
                    .toList(),
              ),
              // day
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: day
                    .map((task) => Padding(
                          padding: EdgeInsets.only(left: 100.w),
                          child: Row(
                            children: [
                              const Icon(
                                EvaIcons.checkmark_circle,
                                color: themecolor,
                              ),
                              8.h.horizontalSpace,
                              Text(
                                task,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),

              // night

              Column(
                children: night
                    .map((task) => Padding(
                          padding: EdgeInsets.only(left: 170.w),
                          child: Row(
                            children: [
                              const Icon(
                                EvaIcons.checkmark_circle,
                                color: themecolor,
                              ),
                              8.h.horizontalSpace,
                              Text(
                                task,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
