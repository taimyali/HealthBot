import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/constants/colors.dart';

class AnalyzingScreen extends StatefulWidget {
  const AnalyzingScreen({super.key, required this.predictionResult});

  final Map<String, dynamic> predictionResult;

  @override
  State<AnalyzingScreen> createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   Future.delayed(const Duration(seconds: 2), () {
  //     context.goNamed('result', extra: widget.predictionResult);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: theme_secondary_gradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpinKitFadingCube(
                color: Colors.white,
              ),
              SizedBox(height: 30.h),
              Text(
                'Analyzing your results...',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
