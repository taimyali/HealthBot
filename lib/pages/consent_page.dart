import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/components/beginButton.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/pages/question_page.dart';

class ConsentPage extends StatelessWidget {
  const ConsentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // start emoji
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            child: Image.asset(
              'assets/images/half-happy-emoji.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        //Text

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
                'This app can help you assess potential mental health concerns and provide resources for support.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                )),

            SizedBox(height: 25.h),

            // begin Button
            BeginButton(
              onPressed: () {
                // context.goNamed('question');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QuestionScreen();
                }));
              },
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(delay: 200.ms, duration: 2000.ms),

            SizedBox(height: 30.h),

            const Text(
              'Your data is secure and will never be shared without your consent.',
              textAlign: TextAlign.center,
            )
          ]),
        ),

        // end emoji
        Positioned(
          bottom: 0,
          right: 0,
          child: Hero(
            tag: 'emoji',
            child: Container(
              child: Image.asset(
                'assets/images/half-happy-emoji2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
