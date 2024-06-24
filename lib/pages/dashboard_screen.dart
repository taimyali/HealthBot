import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/auth/login_or_register_page.dart';
import 'package:healthbot/components/articleBox.dart';
import 'package:healthbot/components/articleCardWidget.dart';
import 'package:healthbot/components/doctorCard.dart';
import 'package:healthbot/components/doctorSection.dart';
import 'package:healthbot/components/fitnessStartButton.dart';
import 'package:healthbot/components/myTabBar.dart';
import 'package:healthbot/components/navigation_bar.dart';
import 'package:healthbot/constants/articel_descriptions.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/constants/doctor_desc.dart';
import 'package:healthbot/models/article_model.dart';
import 'package:healthbot/models/doctor_model.dart';
import 'package:healthbot/pages/profile_page.dart';
import 'package:healthbot/providers/auth_provider.dart';
import 'package:healthbot/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

// Articles list
final List articles = [
  Article(
    title: "What is Schizophrenia?",
    imagePath: "assets/images/schizophrenia1.jpg",
    desc: schizophrenia_desc[0],
  ),
  Article(
    title: "Therapies and Treatments",
    imagePath: "assets/images/depression2.jpg",
    desc: depression_desc[2],
  ),
  Article(
    title: "Common Symptoms",
    imagePath: "assets/images/anxiety1.jpg",
    desc: anxiety_desc[1],
  ),
  Article(
    title: "Coping Strategies",
    imagePath: "assets/images/ptsd3.jpg",
    desc: ptsd_desc[3],
  ),
  Article(
    title: "Signs and Symptoms",
    imagePath: "assets/images/schizophrenia2.jpg",
    desc: schizophrenia_desc[1],
  ),
];

final List<String> exercises = ['Pushups', 'Yoga', 'Squats', 'Sit ups'];

class _DashboardScreenState extends State<DashboardScreen> {
  Stream<String?> getUsernameStream() {
    return FirebaseAuth.instance.authStateChanges().asyncMap((user) async {
      if (user == null) return null;

      final userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .get();

      return userData.data()?['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: StreamBuilder<String?>(
          stream: getUsernameStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('');
            }
            if (!snapshot.hasData) {
              return const Text('');
            }
            return Text(
              snapshot.data!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.grey),
            )
                .animate()
                .fadeIn(duration: 200.ms)
                .slideY(duration: 200.ms, begin: -0.1, end: 0);
          },
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProfilePage();
              }));
            },
            icon: const Icon(OctIcons.person),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Container(
                  margin: EdgeInsets.only(right: 10.w, bottom: 2.h),
                  child: IconButton(
                    icon: const Icon(
                      BoxIcons.bx_log_out_circle,
                    ),
                    onPressed: () async {
                      try {
                        await ref.watch(authProvider).signOut(context);
                      } catch (e) {
                        log("Error signing out: $e");
                      }
                    },
                  ));
            },
          ),
        ]
            .animate(delay: 300.ms)
            .fadeIn(duration: 300.ms)
            .saturate(duration: 300.ms, begin: 0.0, end: 1.0)
            .scaleXY(duration: 300.ms, begin: 0.5, end: 1),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
                  )
                      .animate(delay: 300.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                  SizedBox(
                    height: 26.h,
                  ),

                  // Your Plan's box
                  Container(
                    padding: const EdgeInsets.all(1),
                    height: 250.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: theme_primary_gradient,
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 11.w, right: 11.w, top: 20.h, bottom: 20.h),
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Plan’s',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              MyTabBar(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                      .animate(delay: 300.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                  SizedBox(
                    height: 28.sp,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Articles

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'Articles',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                  )
                      .animate(delay: 300.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                ),

                SizedBox(height: 10.h),

                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(28.r)),
                  ),
                  child: ListView.builder(
                          itemCount: articles.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ArticleCardWidget(article: articles[index]);
                          })
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                ),

                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'Top Doctors',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                  )
                      .animate(delay: 300.ms)
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0),
                ),

                SizedBox(height: 15.h),

                SizedBox(
                  height: 220.h,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      DoctorCard(doctor: doctors[0]),
                      DoctorCard(doctor: doctors[1]),
                      DoctorCard(doctor: doctors[2]),
                    ],
                  ),
                )
                    .animate(delay: 300.ms)
                    .fadeIn(duration: 200.ms)
                    .slideY(duration: 200.ms, begin: -0.1, end: 0),
                SizedBox(height: 25.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Exercises',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w600),
                    ).animate(delay: 300.ms).fadeIn(duration: 200.ms)),

                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  // height: 220.h,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      exerciseCard(exercises[0]),
                      exerciseCard(exercises[1]),
                      exerciseCard(exercises[2]),
                    ],
                  ),
                )
                    .animate(delay: 300.ms)
                    .fadeIn(duration: 200.ms)
                    .slideY(duration: 200.ms, begin: -0.1, end: 0),
              ],
            )
          ],
        ),
      ),
    );
  }

  exerciseCard(String task) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(
        bottom: 20.h,
        left: 5.w,
        right: 5.w,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23.r)),
          color: themegrey3.withOpacity(0.6)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Text(
                'x30',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),
              fitnesStartBtn(onPressed: () {
                Utils.FitnessDialog(context, task);
              })
            ],
          ),
          const Spacer(),
          SizedBox(
            child: Lottie.asset(
              animate: false,
              height: 100.h,
              width: 200.w,
              'assets/animations/pushup_animation.json',
              frameRate: const FrameRate(60),
            ),
          ),
        ],
      ),
    );
  }
}
