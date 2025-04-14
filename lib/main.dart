import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:repatriationapp/features/documents/presentation/providers/add_doc_provider.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/authentication/presentation/providers/signin_provider.dart';
import 'features/home/presentation/providers/home_provider.dart';
import 'package:repatriationapp/features/family/presentation/providers/family_info_provider.dart';
import '../../features/request/presentation/providers/request_provider.dart';
import 'package:repatriationapp/features/family/presentation/providers/family_member_provider.dart';
import 'features/family/presentation/providers/family_members_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Configure status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => FamilyInfoProvider()),
        ChangeNotifierProvider(create: (_) => AddDocProvider()),
        ChangeNotifierProvider(create: (_) => FamilyMemberProvider()),
        ChangeNotifierProvider(create: (_) => FamilyMemberProvider()),
        ChangeNotifierProvider(create: (_) => RequestProvider()),
        ChangeNotifierProvider(
            create: (_) => FamilyMembersProvider()..loadFamilyMembers()),

        // Add other providers here
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Repatriation App',
          theme: AppTheme.lightTheme,
          initialRoute: AppRoutes.initial,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
