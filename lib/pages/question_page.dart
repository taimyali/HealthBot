import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/api/api.dart';
import 'package:healthbot/components/myElevatedButton.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/providers/question_provider.dart';
import 'package:healthbot/models/question_model.dart';
import 'package:healthbot/pages/result_page.dart';
import 'package:icons_plus/icons_plus.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Stack(
      children: [
        // ClipShape
        Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/Vector1.png',
              fit: BoxFit.cover,
              height: 470.h,
              width: 480.w,
            )),

        // sthetscope

        Positioned(
            right: 0,
            child: Image.asset(
              'assets/images/sthetoscope.png',
              fit: BoxFit.cover,
            )),

        // Questions & desc
        Positioned(
          top: 105.h,
          left: 30.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Questions',
                style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 110.h,
                width: 190.w,
                child: Text(
                  'Kindly answer the questions below to let us know how you feel and what you are experiencing.',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        //Questions

        Transform.translate(
          offset: Offset(0, 120.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 35.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Count

                  // back icon

                  IconButton(
                      icon: Icon(
                        OctIcons.arrow_left,
                        size: 28.sp,
                      ),
                      onPressed: () {
                        ref.watch(questionProvider).goToPreviousQuestion();
                      },
                      color: themecolor),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Q${ref.watch(questionProvider).currentQuestionIndex + 1}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      // total count
                      Text(
                        ' / 30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: themegrey,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  // Current Question
                  Text(
                    questions[ref.watch(questionProvider).currentQuestionIndex]
                        .text,
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: themegrey,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ).animate().fade(duration: 100.ms),
                  SizedBox(height: 32.h),

                  // yes and no buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Myelevatedbutton(onPressed: () {
                        ref
                            .watch(questionProvider)
                            .answerQuestion(true, context);
                      }),
                      SizedBox(width: 20.w),
                      Myelevatedbutton(
                          isNO: true,
                          onPressed: () {
                            ref
                                .watch(questionProvider)
                                .answerQuestion(false, context);
                          })
                    ],
                  ),

                  SizedBox(height: 20.h),
                  // back button
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 30.h),
            child: Text(
              'Please read each question carefully and answer honestly to get the most accurate results.',
              style: TextStyle(
                fontSize: 14.sp,
                // fontWeight: FontWeight.bold,
                color: themegrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ));
  }
}
