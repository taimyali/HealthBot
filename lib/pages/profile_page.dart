import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthbot/components/beginButton.dart';
import 'package:healthbot/components/myTextBox.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/pages/question_page.dart';
import 'package:healthbot/providers/auth_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Take a quick survey to get the predictions!',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
              SizedBox(height: 20.h),
              BeginButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const QuestionScreen();
                  }));
                },
              )
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
              SizedBox(height: 30.h),

              // Details
              Text('My Details',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey))
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),

              SizedBox(height: 20.h),

              // Change your username

              StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .doc(currentUser!.email)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return MyTextBox(
                            sectionName: 'Username',
                            text: snapshot.data!['username'],
                            onPressed: () {
                              ref
                                  .read(authProvider.notifier)
                                  .editField('username', context);
                            },
                          );
                        }
                        return const Text('');
                      })
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0)
            ],
          )),
    );
  }
}
