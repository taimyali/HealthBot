import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/doctorSection.dart';
import 'package:healthbot/models/doctor_model.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Doctors',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
                )
                    .animate(delay: 300.ms)
                    .fadeIn(duration: 200.ms)
                    .slideY(duration: 200.ms, begin: -0.1, end: 0),
              ),
              SizedBox(height: 24.h),
              // Top Doctors
              const DoctorSection(
                section: 'Top Doctors',
                doctors: [
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),

              SizedBox(
                height: 30.h,
              ), //Experienced
              const DoctorSection(
                section: 'Experienced',
                doctors: [
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
              SizedBox(
                height: 30.h,
              ),
              //Available Today
              const DoctorSection(
                section: 'Available Today',
                doctors: [
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                  Doctor(
                    name: 'Dr. John Doe',
                    imageUrl: 'assets/images/doctor2.png',
                    rating: '(498)',
                    Address: 'Saddar, Doctor\'s Line',
                    Timings: '7:00 PM - 8:00 PM',
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
