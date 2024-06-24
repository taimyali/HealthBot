import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';

class ArticleBox extends StatelessWidget {
  const ArticleBox(
      {super.key,
      required this.title,
      required this.desc,
      required this.color});

  final String title;
  final String desc;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: Container(
        padding: EdgeInsets.only(left: 14.w, top: 14.h, right: 8.w),
        margin: EdgeInsets.only(bottom: 15.h),
        width: 220.w,
        height: 150.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 4), // changes position of shadow
              ),
            ],
            // color: themecolor,
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(28.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily News',
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            2.h.verticalSpace,
            Text(
              desc,
              style: TextStyle(fontSize: 12.sp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
