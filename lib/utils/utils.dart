import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/fitnessStartButton.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:lottie/lottie.dart';

class Utils {
  static void CustomSnackBar(context,
      {color,
      required String text,
      IconData? icon,
      String? subtitle,
      duration}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: duration,
      backgroundColor: color ?? themecolor,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
              8.h.horizontalSpace,
              Container(
                margin: EdgeInsets.only(bottom: 5.h),
                child: Icon(
                  icon,
                  size: 24.sp,
                  color: Colors.white,
                ).animate().fade(duration: 300.ms).scaleXY(begin: 0, end: 1.0),
              )
            ],
          ),
          5.h.verticalSpace,
          Text(
            subtitle!,
          )
        ],
      ),
    ));
  }

  static void OneLineCustomSnackBar(context,
      {color, required String text, IconData? icon, duration}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: color ?? themecolor,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 25.h),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          8.h.horizontalSpace,
          Container(
            margin: EdgeInsets.only(bottom: 5.h),
            child: Icon(
              icon,
              size: 24.sp,
              color: Colors.white,
            ).animate().fade(duration: 300.ms).scaleXY(begin: 0, end: 1.0),
          )
        ],
      ),
    ));
  }

  static void FitnessDialog(context, task) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              height: 180.h,
              width: 345.w,
              decoration: BoxDecoration(
                color: themecolor,
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                  color: Colors.white),
                            ),
                            Text(
                              'x30',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        child: Lottie.asset(
                          animate: true,
                          height: 100.h,
                          width: 150.w,
                          'assets/animations/pushup_animation.json',
                          frameRate: const FrameRate(60),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Quit')),
                      SizedBox(width: 10.w),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: secondaryColor,
                            side: const BorderSide(color: secondaryColor),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Done'))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
