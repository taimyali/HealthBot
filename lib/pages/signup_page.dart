import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/components/myButton.dart';
import 'package:healthbot/components/myTextField.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/providers/auth_provider.dart';
import 'package:healthbot/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.onTap});

  final void Function()? onTap;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();

  // FocusNodes
  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          //stack
          Container(
                  height: 770.h,
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
                        controller: _controller,
                        onLoaded: (composition) {
                          _controller
                            ..duration = composition.duration
                            ..forward();
                        },
                      ),
                    ),

                    Positioned(
                      top: 375.h,
                      left: 29.w, // Adjust left position as needed
                      right: 29.w, // Adjust right position as needed
                      child: SizedBox(
                        child: Column(
                          children: [
                            // Username Field
                            MyTextFormField(
                              focusNode: usernameFocusNode,
                              controller: usernameController,
                              hintText: 'Username',
                              obscuretext: false,
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(height: 12.h),
                            // Email Field
                            MyTextFormField(
                              focusNode: emailFocusNode,
                              controller: emailController,
                              hintText: 'Email',
                              obscuretext: false,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 12.h),
                            // password Field
                            MyTextFormField(
                              focusNode: passwordFocusNode,
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

                            SizedBox(height: 12.h),
                            MyTextFormField(
                              focusNode: confirmPasswordFocusNode,
                              controller: confirmPasswordController,
                              hintText: 'Confirm Password',
                              obscuretext: _isConfirmPasswordVisible,
                              maxlines: 1,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 18.sp,
                                ),
                                onPressed: _toggleConfirmPasswordVisibility,
                              ),
                            ),
                            SizedBox(height: 10.h),

                            //Forgor Password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text('Already have an account? ',
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold)),
                                GestureDetector(
                                  onTap: widget.onTap,
                                  child: const Text('Sign in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            SizedBox(height: 23.h),
                            Consumer(
                              builder: (BuildContext context, WidgetRef ref,
                                  Widget? child) {
                                return MyButton(
                                  onPressed: () {
                                    ref.read(authProvider.notifier).signUp(
                                        context,
                                        emailController.text,
                                        usernameController.text,
                                        passwordController.text,
                                        confirmPasswordController.text,
                                        usernameFocusNode,
                                        emailFocusNode,
                                        passwordFocusNode,
                                        confirmPasswordFocusNode);
                                  },
                                  text: 'Sign Up',
                                );
                              },
                            )
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
          //   'or sign up with',
          //   style: TextStyle(color: Colors.grey),
          // ),

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
          // ),

          SizedBox(
            height: 50.h,
          ),
        ]),
      ),
    );
  }
}
