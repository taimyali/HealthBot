import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';

class fitnesStartBtn extends StatelessWidget {
  const fitnesStartBtn({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 90.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: theme_secondary_gradient),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            overlayColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Text('Start',
              style: TextStyle(
                fontSize: 15.sp,
                // color: Colors.white,
              ))),
    );
  }
}
