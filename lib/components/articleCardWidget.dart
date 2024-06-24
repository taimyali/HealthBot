// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:healthbot/models/article_model.dart';
// import 'package:healthbot/pages/articles_details_screen.dart';

// class ArticleCardWidget extends StatelessWidget {
//   final Article article;

//   const ArticleCardWidget({
//     super.key,
//     required this.article,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ArticlesDetailsScreen(
//                         article: article,
//                       )));
//         },
//         child: Padding(
//           padding: EdgeInsets.only(
//             left: 10.w,
//           ),
//           child: SizedBox(
//             height: 250.h,
//             width: 232.w,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(16.r)),
//                     child: Container(
//                       height: 153.h,
//                       width: 232.w,
//                       decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(16.r))),
//                       child: Image.asset(article.imagePath, fit: BoxFit.cover),
//                     )),
//                 SizedBox(height: 12.h),
//                 Padding(
//                   padding: EdgeInsets.only(left: 8.w),
//                   child: Text(
//                     textAlign: TextAlign.start,
//                     article.title,
//                     style:
//                         TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           )
//               .animate(delay: 200.ms)
//               .fadeIn(duration: 200.ms)
//               .slideX(duration: 200.ms, begin: -0.1, end: 0),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/models/article_model.dart';
import 'package:healthbot/pages/articles_details_screen.dart';

class ArticleCardWidget extends StatelessWidget {
  final Article article;

  const ArticleCardWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ArticlesDetailsScreen(article: article),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // const begin = Offset(1.0, 0.0);
                // const end = Offset.zero;
                // const curve = Curves.easeInOut;

                // var tween = Tween(begin: begin, end: end).chain(
                //   CurveTween(curve: curve),
                // );

                return FadeTransition(
                  opacity: animation,
                  // position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: SizedBox(
            height: 250.h,
            width: 232.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  child: Container(
                    height: 153.h,
                    width: 232.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    ),
                    child: Image.asset(article.imagePath, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    textAlign: TextAlign.start,
                    article.title,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 200.ms).slideX(
                duration: 200.ms,
                begin: -0.1,
                end: 0,
              ),
        ),
      ),
    );
  }
}

// 