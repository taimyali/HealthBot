import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthbot/components/fitness_tabBar.dart';
import 'package:healthbot/constants/colors.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    ExerciseHeading(),
                    SizedBox(height: 20.h),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.r)),
                      color: Colors.red,
                      child: Container(
                        height: 145.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: fitness_card_gradient,
                            borderRadius:
                                BorderRadius.all(Radius.circular(28.r))),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                              left: 40.w,
                              child: Container(
                                height: 110.h,
                                width: 110.w,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade700,
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: const Offset(
                                          1, 2), // changes position of shadow
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  gradient: fitness_card_goals_gradient,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '100%',
                                      style: TextStyle(
                                          height: 1.2.h,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26.sp),
                                    ),
                                    Text(
                                      'Goal Achieved',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 20.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Heartbeat',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        Text('97 bpm ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Calories burned',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        Row(children: [
                                          SvgPicture.asset(
                                              'assets/images/fire_streak.svg',
                                              height: 20.h,
                                              width: 20.w),
                                          const Text('438 Cal',
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ])
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 700.h,
                      child: const DefaultTabController(
                              length: 3, child: FitnessTabbar())
                          .animate(delay: 100.ms)
                          .fadeIn(duration: 200.ms)
                          .slideY(duration: 200.ms, begin: 0.01, end: 0),
                    ),
                  ]))),
    );
  }

  ExerciseHeading() {
    return Text(
      'Exercises',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
    );
  }

  statsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      color: Colors.red,
      child: Container(
        height: 145.h,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: fitness_card_gradient,
            borderRadius: BorderRadius.all(Radius.circular(28.r))),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: 40.w,
              child: Container(
                height: 110.h,
                width: 110.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(1, 2), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  gradient: fitness_card_goals_gradient,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '100%',
                      style: TextStyle(
                          height: 1.2.h,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp),
                    ),
                    Text(
                      'Goal Achieved',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Heartbeat',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('97 bpm ', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Calories burned',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Row(children: [
                          SvgPicture.asset('assets/images/fire_streak.svg',
                              height: 20.h, width: 20.w),
                          const Text('438 Cal',
                              style: TextStyle(color: Colors.white))
                        ])
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: 300.ms)
        .fadeIn(duration: 200.ms)
        .slideY(duration: 200.ms, begin: -0.1, end: 0);
  }

  fitness_card_text() {
    return Positioned(
      right: 20.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Heartbeat',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('97 bpm ', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Calories burned',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Row(children: [
                  SvgPicture.asset('assets/images/fire_streak.svg',
                      height: 20.h, width: 20.w),
                  const Text('438 Cal', style: TextStyle(color: Colors.white))
                ])
              ],
            )
          ],
        ),
      ),
    );
  }

  fitnessStats_circle() {
    return Positioned(
      left: 40.w,
      child: Container(
        height: 110.h,
        width: 110.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade700,
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(1, 2), // changes position of shadow
            ),
          ],
          shape: BoxShape.circle,
          gradient: fitness_card_goals_gradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '100%',
              style: TextStyle(
                  height: 1.2.h,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.sp),
            ),
            Text(
              'Goal Achieved',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
