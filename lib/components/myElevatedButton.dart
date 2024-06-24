import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/providers/question_provider.dart';

class Myelevatedbutton extends StatelessWidget {
  const Myelevatedbutton(
      {super.key, required this.onPressed, this.isNO = false});

  final void Function()? onPressed;
  final bool isNO;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        overlayColor: isNO ? Colors.red : secondaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(color: isNO ? Colors.red : secondaryColor, width: 2.w),
      ),
      // onPressed: () => _answerQuestion(true),
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            isNO ? 'No' : 'Yes',
            style: TextStyle(
                color: isNO ? Colors.red : secondaryColor, fontSize: 20.sp),
          ),
          SizedBox(width: 20.w),
          Icon(
            isNO ? Icons.close : Icons.check,
            color: isNO ? Colors.red : secondaryColor,
            size: 26.sp,
          ),
        ],
      ),
    );
  }
}
