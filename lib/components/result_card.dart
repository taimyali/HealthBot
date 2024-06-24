import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';

class ResultCard extends StatefulWidget {
  const ResultCard({
    required this.FormattedDate,
    required this.predictionResult,
    required this.index,
    super.key,
    required this.FormattedTime,
    required this.onExpansionChanged,
  });

  final String FormattedDate;
  final String FormattedTime;
  final Map<String, dynamic> predictionResult;
  final int index;

  final ValueChanged<bool> onExpansionChanged;

  @override
  _ResultCardState createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            textColor: themecolor,
            iconColor: themecolor,
            onExpansionChanged: widget.onExpansionChanged,
            subtitle: Text(widget.FormattedTime,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                )),
            title: Text(
              widget.FormattedDate,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),

                      // Identified Conditions
                      Text('Prediction\nResults',
                          style: TextStyle(
                            height: 1.2.h,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                          )).animate().fade(duration: 400.ms),
                      // .slideY(begin: -0.8, end: 0.0, duration: 400.ms),

                      SizedBox(height: 25.h),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.predictionResult.entries.length,
                        itemBuilder: (context, index) {
                          final entry =
                              widget.predictionResult.entries.elementAt(index);
                          return Container(
                            width: double.infinity,
                            height: 50.h,
                            padding: EdgeInsets.only(
                              top: 12.h,
                              bottom: 12.h,
                              left: 10.w,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              color: secondaryColor,
                            ),
                            margin: EdgeInsets.only(top: 10.h),
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ).animate().fade(duration: 400.ms);
                          // .slideY(begin: -0.8, end: 0.0, duration: 300.ms)
                        },
                      ),

                      SizedBox(height: 30.h),

                      // Text(
                      //   'What\'s next?',
                      //   style: TextStyle(
                      //       fontSize: 22.sp, fontWeight: FontWeight.w600),
                      // ).animate().fade(duration: 400.ms)
                    ]),
              )
            ],
          ),
        ));
  }
}
