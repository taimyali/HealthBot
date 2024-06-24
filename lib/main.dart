import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthbot/auth/auth.dart';
import 'package:healthbot/constants/colors.dart';
import 'package:healthbot/firebase_options.dart';
import 'package:healthbot/pages/login_page.dart';
import 'package:healthbot/pages/profile_page.dart';
import 'package:healthbot/pages/splash_screen.dart';
import 'package:healthbot/routes/appRoutes.dart';

void main() async {
  Animate.restartOnHotReload = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(
      child: DevicePreview(
          data: const DevicePreviewData(isVirtualKeyboardVisible: true),
          isToolbarVisible: false,
          backgroundColor: themecolor,
          enabled: false,
          builder: (context) => const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Image image1;

  late Image image2;

  @override
  initState() {
    super.initState();
    image1 = Image.asset("assets/images/bp_disorder1.jpg");
    image2 = Image.asset("assets/images/bp_disorder4.jpg");
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // This widget is the root of your application.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 892),
        builder: (context, child) => MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.from(
                colorScheme: ColorScheme.fromSeed(seedColor: themecolor),
              ),
              title: 'Flutter Demo',
              // routerConfig: AppRouter.router,
              home: const SplashScreen(),
            ));
  }
}
