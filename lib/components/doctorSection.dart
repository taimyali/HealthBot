import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/doctorCard.dart';
import 'package:healthbot/models/doctor_model.dart';

class DoctorSection extends StatelessWidget {
  const DoctorSection({
    super.key,
    required this.section,
    required this.doctors,
  });

  final List<Doctor> doctors;
  final String section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            section,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            cacheExtent: 300,
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return DoctorCard(doctor: doctors[index]);
            },
          ),
        ),
      ],
    );
  }
}
