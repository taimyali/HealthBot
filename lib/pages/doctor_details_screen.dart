import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/myButton.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/models/doctor_model.dart';
import 'package:icons_plus/icons_plus.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: themecolor,
            expandedHeight: 480.h,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    doctor.imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
                    .animate(delay: 200.ms)
                    .fadeIn(duration: 200.ms)
                    .slideY(duration: 100.ms, begin: -0.1, end: 0),
              ],
            ),
            // floating: true,
            // pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.2.h,
                        ),
                      )
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 200.ms)
                          .slideY(duration: 200.ms, begin: -0.1, end: 0),
                      Text(
                        doctor.rating,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      )
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 200.ms)
                          .slideY(duration: 200.ms, begin: -0.1, end: 0),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'A good therapy doctor for all of your medical and consultation needs with 8 years of experience.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[700],
                    ),
                  )
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                  SizedBox(height: 20.h),
                  const Divider(),
                  Row(
                    children: [
                      const Icon(
                        EvaIcons.clock,
                        color: themecolor,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        doctor.Timings,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                  const Divider(),
                  Row(
                    children: [
                      const Icon(
                        EvaIcons.pin,
                        color: themecolor,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        doctor.Address,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                  const Divider(),

                  SizedBox(
                    height: 30.h,
                  ),
                  // button
                  Center(
                    child: MyButton(
                      text: 'Book Appointment',
                      onPressed: () {},
                      color: themecolor,
                    ),
                  )
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 200.ms)
                      .scaleXY(duration: 200.ms, begin: 0, end: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
