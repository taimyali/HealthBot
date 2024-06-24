import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/components/myButton.dart';
import 'package:healthbot/components/myTextField.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/pages/forgot_password.dart';
import 'package:healthbot/providers/auth_provider.dart';
import 'package:healthbot/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(children: [
          //stack
          Container(
                  height: 650.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(61),
                          bottomRight: Radius.circular(61)),
                      gradient: theme_primary_gradient,

                      // shadow
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 5.7,
                          offset:
                              const Offset(0, 7), // changes position of shadow
                        ),
                      ]),

                  // Stack
                  child: Stack(children: [
                    // lottie Animation Doctor

                    SizedBox(
                      height: 423.h,
                      width: 424.w,
                      child: Lottie.asset(
                        'assets/animations/doctor_animation.json',
                        frameRate: const FrameRate(60),
                      ),
                    ),

                    Positioned(
                      top: 375.h,
                      left: 29.w, // Adjust left position as needed
                      right: 29.w, // Adjust right position as needed
                      child: SizedBox(
                        child: Column(
                          children: [
                            // Email Field
                            MyTextFormField(
                              controller: emailController,
                              hintText: 'Email',
                              obscuretext: false,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20.h),
                            // password Field
                            MyTextFormField(
                              controller: passwordController,
                              hintText: 'Password',
                              obscuretext: _isPasswordVisible,
                              maxlines: 1,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 18.sp,
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            //Forgor Password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: widget.onTap,
                                  child: const Text('Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 300),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return SlideTransition(
                                                position: Tween<Offset>(
                                                        begin:
                                                            const Offset(1, 0),
                                                        end: Offset.zero)
                                                    .animate(animation),
                                                child: child);
                                          },
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) {
                                            return const ForgotPasswordPage();
                                          },
                                        ));
                                  },
                                  child: const Text('Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            SizedBox(height: 23.h),
                            Consumer(builder: (context, ref, child) {
                              return MyButton(
                                onPressed: () {
                                  ref.read(authProvider.notifier).signIn(
                                      context,
                                      emailController.text,
                                      passwordController.text);
                                },
                                text: 'Login',
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ]))
              .animate()
              .fadeIn()
              .scaleY(duration: 200.ms, begin: 0.9, end: 1.0),
          SizedBox(
            height: 69.h,
          ),

          // login with google and facebook
          // const Text(
          //   'or sign in with',
          //   style: TextStyle(color: Colors.grey),
          // ).animate().fadeIn().scaleY(duration: 200.ms, begin: 0.9, end: 1.0),

          // SizedBox(
          //   height: 36.h,
          // ),
          // Center(
          //   child: SizedBox(
          //     width: 200.w,
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Brand(
          //           Brands.facebook,
          //           size: 50.h,
          //         ),
          //         Brand(
          //           Brands.google,
          //           size: 42.h,
          //         ),
          //       ],
          //     ),
          //   ),
          // ).animate().fadeIn().scaleY(duration: 200.ms, begin: 0.9, end: 1.0),
        ]),
      ),
    );
  }
}
