import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/models/doctor_model.dart';
import 'package:healthbot/pages/doctor_details_screen.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DoctorDetailsScreen(doctor: doctor);
        }));
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(28.r)),
            border: Border.all(color: themecolor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              Container(
                height: 160.h,
                width: 130.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(28.r))),
                child: Image.asset(doctor.imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      doctor.name,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      doctor.rating,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
