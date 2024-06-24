// import 'package:flutter/material.dart';

// class TopShapePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = const Color(0xFF1E88E5) // Blue color
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.lineTo(0, size.height * 0.5);
//     path.quadraticBezierTo(
//         size.width * 0.5, size.height, size.width, size.height * 0.5);
//     path.lineTo(size.width, 0);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
