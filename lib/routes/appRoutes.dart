import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthbot/auth/auth.dart';
import 'package:healthbot/auth/login_or_register_page.dart';
import 'package:healthbot/pages/analyzing_screen.dart';
import 'package:healthbot/pages/bottom_navigation_screen.dart';
import 'package:healthbot/pages/consent_page.dart';
import 'package:healthbot/pages/dashboard_screen.dart';
import 'package:healthbot/pages/landing_page.dart';
import 'package:healthbot/pages/login_page.dart';
import 'package:healthbot/pages/question_page.dart';
import 'package:healthbot/pages/result_page.dart';
import 'package:healthbot/pages/signup_page.dart';
import 'package:healthbot/pages/splash_screen.dart';

class AppRouter {
  // initializing go router
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable:
        GoRouterRefreshListenable(FirebaseAuth.instance.authStateChanges()),
    initialLocation: '/auth',
    routes: <RouteBase>[
      // Splash Screen
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),

      //auth page Route
      GoRoute(
        name: 'auth',
        path: '/auth',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const AuthPage(),
          );
        },
      ),

      //LoginorRegister Route
      GoRoute(
        name: 'loginorRegister',
        path: '/loginorRegister',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const LoginOrRegisterPage(),
          );
        },
      ),

      //Login Route
      GoRoute(
        name: 'login',
        path: '/login',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const LoginPage(),
          );
        },
      ),

      //Signup Route
      GoRoute(
        name: 'signUp',
        path: '/signUp',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const SignUpPage(),
          );
        },
      ),
      // Landing Page
      GoRoute(
        name: 'landing',
        path: '/landing',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const LandingPage(),
          );
        },
      ),

      // consent screen
      GoRoute(
        name: 'consent',
        path: '/consent',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const ConsentPage(),
          );
        },
      ),
      // question screen
      GoRoute(
        name: 'question',
        path: '/question',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const QuestionScreen(),
          );
        },
      ),

      //Analyzing result screen

      GoRoute(
        name: 'analyze',
        path: '/analyze',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final predictionResult = state.extra as Map<String, dynamic>;
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: AnalyzingScreen(predictionResult: predictionResult),
          );
        },
      ),

      // result screen
      GoRoute(
        name: 'result',
        path: '/result',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final predictionResult = state.extra as Map<String, dynamic>;
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: ResultScreen(predictionResult: predictionResult),
          );
        },
      ),
      // dashboard screen
      GoRoute(
        name: 'dashboard',
        path: '/dashboard',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const DashboardScreen(),
          );
        },
      ),
      // bottom nav screen
      GoRoute(
        name: 'bottomNav',
        path: '/bottomNav',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 300),
            barrierColor: Colors.black.withOpacity(0.5),
            opaque: false,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const BottomNavigationScreen(),
          );
        },
      ),
    ],
  );
}

class GoRouterRefreshListenable extends ChangeNotifier {
  GoRouterRefreshListenable(Stream stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (_) {
        notifyListeners();
      },
    );
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
