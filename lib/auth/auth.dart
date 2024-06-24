import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthbot/auth/login_or_register_page.dart';
import 'package:healthbot/auth/verify_email_page.dart';
import 'package:healthbot/components/navigation_bar.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/pages/bottom_navigation_screen.dart';
import 'package:healthbot/pages/dashboard_screen.dart';
import 'package:healthbot/pages/landing_page.dart';
import 'package:healthbot/pages/question_page.dart';
import 'package:healthbot/providers/auth_provider.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: ref.read(authProvider.notifier).authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator if the connection state is waiting
          return const SpinKitFadingCube(
            color: themecolor,
            size: 20.0,
          );
        } else if (snapshot.hasData) {
          // User is logged in
          final User? user = snapshot.data;
          final bool emailVerified = user!.emailVerified;

          if (emailVerified) {
            // If email is verified, navigate to dashboard directly
            return const BottomNavigationScreen();
          } else {
            // If email is not verified, navigate to verify email page
            return const VerifyEmailPage();
          }
        } else {
          // User is not logged in, navigate to login or register page
          return const LoginOrRegisterPage();
        }
      },
    );
  }
}
