import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/components/articleCardWidget.dart';
import 'package:healthbot/components/diseaseSection.dart';
import 'package:healthbot/constants/articel_descriptions.dart';
import 'package:healthbot/models/article_model.dart';
import 'package:healthbot/pages/profile_page.dart';
import 'package:icons_plus/icons_plus.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   elevation: 0,
      //   shadowColor: Colors.transparent,
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: true,
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(right: 8.w),
      //       child: IconButton(
      //         onPressed: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) {
      //             return const ProfilePage();
      //           }));
      //         },
      //         icon: const Icon(OctIcons.person),
      //       ),
      //     ),
      //   ],
      // ),
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
                  'Articles',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
                )
                    .animate(delay: 300.ms)
                    .fadeIn(duration: 200.ms)
                    .slideY(duration: 200.ms, begin: -0.1, end: 0),
              ),
              SizedBox(height: 26.h),
              //"Bipolar disorder"
              DiseaseSection(
                disease: "Bipolar disorder",
                articles: [
                  Article(
                    title: "Understanding Bipolar Disorder",
                    imagePath: "assets/images/bp_disorder1.jpg",
                    desc: bipolar_desc[0],
                  ),
                  Article(
                    title: "Symptoms and Diagnosis",
                    imagePath: "assets/images/bp_disorder4.jpg",
                    desc: bipolar_desc[1],
                  ),
                  Article(
                    title: "Treatment Options",
                    imagePath: "assets/images/bp_disorder2.jpg",
                    desc: bipolar_desc[2],
                  ),
                  Article(
                    title: "Living with Bipolar Disorder",
                    imagePath: "assets/images/bp_disorder.jpg",
                    desc: bipolar_desc[3],
                  ),
                  Article(
                    title: "Supporting Loved Ones",
                    imagePath: "assets/images/ptsd3.jpg",
                    desc: bipolar_desc[4],
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),

              // "Schizophrenia",
              DiseaseSection(
                disease: "Schizophrenia",
                articles: [
                  Article(
                    title: "What is Schizophrenia?",
                    imagePath: "assets/images/schizophrenia1.jpg",
                    desc: schizophrenia_desc[0],
                  ),
                  Article(
                    title: "Signs and Symptoms",
                    imagePath: "assets/images/schizophrenia2.jpg",
                    desc: schizophrenia_desc[1],
                  ),
                  Article(
                    title: "Treatment and Management",
                    imagePath: "assets/images/schizophrenia3.jpg",
                    desc: schizophrenia_desc[2],
                  ),
                  Article(
                    title: "Challenges and Coping",
                    imagePath: "assets/images/schizophrenia.jpg",
                    desc: schizophrenia_desc[3],
                  ),
                  Article(
                    title: "Research and Future Directions",
                    imagePath: "assets/images/schizophrenia4.jpg",
                    desc: schizophrenia_desc[4],
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
              // Depression
              DiseaseSection(
                disease: "Depression",
                articles: [
                  Article(
                    title: "Understanding Depression",
                    imagePath: "assets/images/depression.jpg",
                    desc: depression_desc[0],
                  ),
                  Article(
                    title: "Symptoms and Types",
                    imagePath: "assets/images/depression1.jpg",
                    desc: depression_desc[1],
                  ),
                  Article(
                    title: "Therapies and Treatments",
                    imagePath: "assets/images/depression2.jpg",
                    desc: depression_desc[2],
                  ),
                  Article(
                    title: "Impact on Daily Life",
                    imagePath: "assets/images/depression3.png",
                    desc: depression_desc[3],
                  ),
                  Article(
                    title: "How to Seek Help",
                    imagePath: "assets/images/depression4.png",
                    desc: depression_desc[4],
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
              // Anxiety disorder
              DiseaseSection(
                disease: "Anxiety disorder",
                articles: [
                  Article(
                    title: "Anxiety Disorder Overview",
                    imagePath: "assets/images/anxiety.png",
                    desc: anxiety_desc[0],
                  ),
                  Article(
                    title: "Common Symptoms",
                    imagePath: "assets/images/anxiety1.jpg",
                    desc: anxiety_desc[1],
                  ),
                  Article(
                    title: "Treatment and Therapy",
                    imagePath: "assets/images/anxiety2.jpg",
                    desc: anxiety_desc[2],
                  ),
                  Article(
                    title: "Managing Anxiety",
                    imagePath: "assets/images/anxiety3.jpg",
                    desc: anxiety_desc[3],
                  ),
                  Article(
                    title: "Resources and Support",
                    imagePath: "assets/images/anxiety4.jpg",
                    desc: anxiety_desc[4],
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 200.ms)
                  .slideY(duration: 200.ms, begin: -0.1, end: 0),
              // PTSD
              DiseaseSection(
                disease: "PTSD",
                articles: [
                  Article(
                    title: "Understanding PTSD",
                    imagePath: "assets/images/ptsd.jpg",
                    desc: ptsd_desc[0],
                  ),
                  Article(
                    title: "Symptoms and Triggers",
                    imagePath: "assets/images/ptsd1.jpg",
                    desc: ptsd_desc[1],
                  ),
                  Article(
                    title: "Treatment Options",
                    imagePath: "assets/images/ptsd2.jpg",
                    desc: ptsd_desc[2],
                  ),
                  Article(
                    title: "Coping Strategies",
                    imagePath: "assets/images/ptsd3.jpg",
                    desc: ptsd_desc[3],
                  ),
                  Article(
                    title: "Support for Veterans",
                    imagePath: "assets/images/ptsd4.jpg",
                    desc: ptsd_desc[4],
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
