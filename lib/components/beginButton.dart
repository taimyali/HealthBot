import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';

class BeginButton extends StatelessWidget {
  const BeginButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          // overlayColor: themecolor,
          foregroundColor: Colors.white,
          backgroundColor: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(150, 45),
        ),
        onPressed: onPressed,
        child: Text('Begin Assessment',
            style: TextStyle(
              fontSize: 16.sp,
              // color: Colors.white,
            )));
  }
}
