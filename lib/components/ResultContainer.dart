import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/pages/bottom_navigation_screen.dart';
import 'package:healthbot/pages/dashboard_screen.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key, required this.predictionResult});

  final Map<String, dynamic> predictionResult;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(1),
        height: 500.h,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: theme_primary_gradient,
            borderRadius: BorderRadius.all(
              Radius.circular(28.r),
            )),
        child: Container(
          height: 415.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(28.r),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),

              // Identified Conditions
              Text('Identified\nConditions',
                      style: TextStyle(
                        height: 1.2.h,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ))
                  .animate(delay: 400.ms)
                  .fade(duration: 400.ms)
                  .slideY(begin: -0.8, end: 0.0, duration: 400.ms),

              SizedBox(height: 25.h),

              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: predictionResult.entries.length,
                itemBuilder: (context, index) {
                  final entry = predictionResult.entries.elementAt(index);
                  return Container(
                    width: double.infinity,
                    height: 50.h,
                    padding: EdgeInsets.only(
                      top: 12.h,
                      bottom: 12.h,
                      left: 10.w,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      color: secondaryColor,
                    ),
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text(
                      entry.key,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  )
                      .animate(delay: 400.ms)
                      .fade(duration: 400.ms)
                      .slideY(begin: -0.8, end: 0.0, duration: 400.ms)
                      .saturate(
                        duration: 800.ms,
                        curve: Curves.easeInOut,
                      );
                },
              ),

              SizedBox(height: 30.h),

              Text(
                'What\'s next?',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
              )
                  .animate(delay: 500.ms)
                  .fade(duration: 500.ms)
                  .slideY(begin: -0.8, end: 0.0, duration: 500.ms),

              SizedBox(height: 26.h),

              ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themecolor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.r)),
                          )),
                      onPressed: () {
                        // context.goNamed('dashboard');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.h),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child:
                            const SizedBox(child: Text('Let\'s\' Get Better')),
                      ))
                  .animate(delay: 500.ms)
                  .fade(duration: 500.ms)
                  .slideY(begin: -0.8, end: 0.0, duration: 500.ms)
                  .then(delay: 400.ms)
                  .shimmer(duration: 1800.ms),
            ],
          ),
        ),
      ),
    ]);
  }
}
