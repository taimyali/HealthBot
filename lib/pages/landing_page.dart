import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/pages/consent_page.dart';
import 'package:healthbot/providers/auth_provider.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
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
      floatingActionButton: FloatingActionButton(
        heroTag: 'beginButton',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ConsentPage();
          }));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward_ios,
          color: secondaryColor,
        ),
      ).animate(delay: 400.ms).fade(duration: 300.ms).scaleXY(duration: 300.ms),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: theme_secondary_gradient,
            ),
          ),

          //text
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold),
              )
                  .animate()
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
              StreamBuilder<String?>(
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
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold),
                  )
                      .animate()
                      .fadeIn(duration: 200.ms)
                      .slideY(duration: 200.ms, begin: -0.1, end: 0);
                },
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Let's start understanding your wellbeing.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
          ),

          //emoji
          Positioned(
            bottom: 0,
            left: 18,
            child: Container(
              child: Image.asset(
                'assets/images/happy-emoji.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
