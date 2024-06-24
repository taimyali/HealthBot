import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/constants/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      this.text,
      required this.onPressed,
      this.color = secondaryColor});

  final text;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          overlayColor: WidgetStateProperty.resolveWith(
            (states) {
              return states.contains(WidgetState.pressed) ? Colors.white : null;
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              return states.contains(WidgetState.pressed) ? null : color;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              return states.contains(WidgetState.pressed) ? null : Colors.white;
            },
          ),
          shadowColor: WidgetStateProperty.resolveWith(
            (states) => null,
          ),
          surfaceTintColor: WidgetStateProperty.resolveWith(
            (states) => null,
          ),
          // elevation: 0,
          fixedSize: WidgetStateProperty.resolveWith(
            (states) => const Size(301, 42),
          ),
          // backgroundColor: secondaryColor,
          // foregroundColor: Colors.white,

          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // // padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          textStyle: WidgetStateProperty.resolveWith(
            (states) => TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          )),
      child: Text(text),
    );
  }
}
