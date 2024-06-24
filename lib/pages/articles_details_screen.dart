import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/models/article_model.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 300.h,
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28.r),
                    bottomRight: Radius.circular(28.r),
                  ),
                  child: Image.asset(
                    article.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 200.ms)
                  .saturate(duration: 400.ms, begin: 0.0, end: 1.0)
              // .slideY(duration: 200.ms, begin: -0.1, end: 0),
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
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2.h,
                  ),
                )
                    .animate(delay: 300.ms)
                    .fadeIn(duration: 200.ms)
                    .slideY(duration: 200.ms, begin: -0.1, end: 0),
                SizedBox(height: 20.h),
                Text(
                  article.desc,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey[700],
                  ),
                )
                    .animate(delay: 300.ms)
                    .fadeIn(duration: 200.ms)
                    .slideY(duration: 200.ms, begin: -0.1, end: 0),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
