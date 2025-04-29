import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repatriationapp/lib/View/donor/donor_home_screen.dart';
import 'package:repatriationapp/lib/View/donor/donor_profile_completion.dart';
import 'View/home/home_screen.dart';
import 'Component/app_theme.dart';
import 'Component/general_response.dart';
import 'Component/translation.dart';
import 'Controller/AuthController.dart';
import 'Controller/InternetController.dart';
import 'Controller/changelocal.dart';
import 'View/onboarding/onboarding_page.dart';
import 'View/authentication/registration_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // Get.put(AuthController()); // inject AuthController
  HttpOverrides.global = MyHttpOverrides();
  // Get.put(InternetController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    String locale = Platform.localeName.split('_')[0];
    controller.language = Locale(locale);
    print(locale);
    print(controller.language);
    print(Token);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xffffffff)),
    );
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,

        builder:
            (_, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Repatriation App',
              theme: controller.appTheme,
              home:
                  (Token == null || Token!.isEmpty)
                      ? DonorHomeScreen()
                      : DonorHomeScreen(),

              //initialRoute: AppRoutes.initial,
              // onGenerateRoute: AppRoutes.generateRoute,
            ),
      ),
    );
  }
}
