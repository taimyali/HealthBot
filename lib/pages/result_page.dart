import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/ResultContainer.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> predictionResult;

  const ResultScreen({super.key, required this.predictionResult});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //Ellipse
            Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/Ellipse.png',
                      fit: BoxFit.cover,
                      width: 420.w,
                      height: 410.h,
                    ))
                .animate()
                // .slideY(begin: 4.0, end: 0.0, duration: 300.ms)

                .scaleXY(begin: 0.2, end: 1.0, duration: 300.ms),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text('Possible areas of concern',
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          height: 1.h)),
                  SizedBox(height: 40.h),

                  //  Result  Container

                  ResultContainer(
                    predictionResult: predictionResult,
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 50.h,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 330.w,
                  child: const Text(
                    'These results are for informational purposes and do not replace professional assessment.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(delay: 300.ms)
                      .fade(duration: 300.ms)
                      .slideY(begin: -0.8, end: 0.0, duration: 300.ms),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// ...predictionResult.entries.map((entry) =>
//                     Text(entry.key, style: const TextStyle(fontSize: 16.0))),