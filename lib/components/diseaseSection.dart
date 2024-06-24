import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/articleCardWidget.dart';
import 'package:healthbot/models/article_model.dart';
import 'package:redacted/redacted.dart';

class DiseaseSection extends StatelessWidget {
  final String disease;
  final List<Article> articles;

  const DiseaseSection({
    super.key,
    required this.disease,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            disease,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            cacheExtent: 300,
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleCardWidget(article: articles[index]);
            },
          ),
        ),
      ],
    );
  }
}
