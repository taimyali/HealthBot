import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/fitnessStartButton.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class FitnessTabbar extends StatefulWidget {
  const FitnessTabbar({super.key});

  @override
  _FitnessTabbarState createState() => _FitnessTabbarState();
}

class _FitnessTabbarState extends State<FitnessTabbar> {
  final List<String> beginner = ['Pushups', 'Yoga', 'Squats', 'Sit ups'];
  final List<String> intermediate = ['Jogging', 'Pullups', 'Cycling', 'Plank'];
  final List<String> expert = [
    'Morning Run',
    'Lunges',
    'Gardening',
    'Meditation'
  ];
  bool showAnimation = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 45.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: themegrey2,
              ),
              child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  overlayColor:
                      WidgetStateProperty.all(secondaryColor.withOpacity(0.1)),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r), // Creates border
                    color: secondaryColor, //Cha
                  ),
                  dividerColor: Colors.transparent,
                  splashBorderRadius: BorderRadius.circular(16.r),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: secondaryColor,
                  tabs: [
                    Tab(
                      icon: Text(
                        'Beginner',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Intermediate',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Expert',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ),
                  ]),
            )),
        SizedBox(height: 20.h),
        const Row(
          children: [
            Text(
              'Day 1',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '/30',
              style: TextStyle(),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: TabBarView(
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                // morning
                Column(
                  children: beginner
                      .map((task) => exerciseCard(task, context))
                      .toList(),
                ),
                // day
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: intermediate
                      .map((task) => exerciseCard(task, context))
                      .toList(),
                ),
                // night
                Column(
                  children: expert
                      .map((task) => exerciseCard(task, context))
                      .toList(),
                ),
              ]),
        )
      ],
    );
  }

  Widget exerciseCard(String task, BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(
        bottom: 20.h,
        left: 5.w,
        right: 5.w,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23.r)),
          color: themegrey3.withOpacity(0.6)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Text(
                'x30',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),
              fitnesStartBtn(onPressed: () {
                Utils.FitnessDialog(context, task);
              })
            ],
          ),
          const Spacer(),
          SizedBox(
              child: Lottie.asset(
            animate: false,
            height: 100.h,
            width: 200.w,
            'assets/animations/pushup_animation.json',
            frameRate: const FrameRate(60),
          )),
        ],
      ),
    );
  }
}
