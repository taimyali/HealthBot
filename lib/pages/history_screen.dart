import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthbot/components/result_card.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/helper/helper_methods.dart';
import 'package:healthbot/utils/utils.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  Future<void> _deleteHistory(context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        showDialog(
            context: context,
            builder: (context) => const Center(
                  child: SpinKitFadingCube(
                    color: themecolor,
                    size: 20.0,
                  ),
                ));
        final collectionRef = FirebaseFirestore.instance
            .collection('Users')
            .doc(user.email)
            .collection('Results');

        final batch = FirebaseFirestore.instance.batch();
        final snapshot = await collectionRef.get();

        for (var doc in snapshot.docs) {
          batch.delete(doc.reference);
        }

        await batch.commit();
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        Navigator.pop(context);
        Utils.OneLineCustomSnackBar(context,
            text: 'Error deleting history',
            color: Colors.red,
            icon: Icons.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        body: user == null
            ? const Center(child: Text('No user logged in'))
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Results History',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await _deleteHistory(context);

                              Utils.OneLineCustomSnackBar(context,
                                  text: 'History deleted',
                                  color: Colors.red,
                                  icon: Icons.error);
                            },
                          )
                              .animate()
                              .fade(duration: 100.ms)
                              .slideY(begin: -0.1, end: 0.0, duration: 100.ms),
                        ]),
                    SizedBox(height: 15.h),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Users')
                            .doc(user.email)
                            .collection('Results')
                            .orderBy('timestamp', descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: SpinKitFadingCube(
                                color: themecolor,
                                size: 20.0,
                              ),
                            );

                            // return const FadeShimmer(
                            //   height: 8,
                            //   width: 150,
                            //   radius: 4,
                            //   highlightColor: Color(0xffF9F9FB),
                            //   baseColor: Color(0xffE6E8EB),
                            // );
                          }
                          if (snapshot.hasError) {
                            return const Center(
                                child: Text('Error loading history'));
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text('No history yet',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20)),
                            );
                          }

                          final results = snapshot.data!.docs;

                          return ListView.builder(
                            itemCount: results.length,
                            itemBuilder: (context, index) {
                              final result = results[index];
                              final predictionResult = result['result'];
                              final timestamp = result['timestamp'];
                              final formattedDate = FormatedDate(timestamp);
                              final formattedtime = FormatedTime(timestamp);

                              return ResultCard(
                                FormattedDate: formattedDate,
                                predictionResult: predictionResult,
                                index: index,
                                FormattedTime: formattedtime,
                                onExpansionChanged: (value) {},
                              ).animate().fade(duration: 300.ms).slideY(
                                  begin: -0.2, end: 0.0, duration: 100.ms);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
