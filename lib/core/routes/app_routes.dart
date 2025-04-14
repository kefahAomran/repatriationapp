import 'package:flutter/material.dart';
import '../../features/authentication/presentation/pages/authentication_screen.dart';
import '../../features/authentication/presentation/pages/registration_screen.dart';
import '../../features/hello/presentation/pages/hello_screen1.dart';
import '../../features/hello/presentation/pages/hello_screen2.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/authentication/presentation/pages/otp_screen.dart';
import '../../features/authentication/presentation/pages/signin_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/documents/presentation/pages/add_doc_screen.dart';
import '../../features/family/presentation/pages/edit_family_info_screen.dart';
import '../../features/family/presentation/pages/add_family_member_screen.dart';
import '../../features/family/presentation/pages/family_members_screen.dart';

import '../../features/request/presentation/pages/add_request_screen.dart';
import '../../features/request/presentation/pages/edit_request_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String hello = '/hello';
  static const String hello2 = '/hello2';

  static const String auth = '/auth';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String signin = '/signin';
  static const String home = '/home';
  static const String adddoc = '/adddoc';
  static const String editfamilyinfo = '/editfamilyinfo';
  static const String addfamilymember = '/addfamilymember';
  static const String addfamilymember1 = '/addfamilymember_n';

  static const String addrequest = '/addrequest';
  static const String editrequest = '/editrequest';

  static Map<String, Widget Function(BuildContext)> routes = {
    initial: (context) => const OnboardingPage(),
    hello: (context) => const HelloScreen1(),
    hello2: (context) => const HelloScreen2(),
    auth: (context) => const AuthenticationScreen(),
    register: (context) => const RegistrationScreen(),
    otp: (context) => const OTPScreen(),
    signin: (context) => const SignInScreen(),
    home: (context) => const HomeScreen(),
    adddoc: (context) => const AddDocumentScreen(),
    editfamilyinfo: (context) => const EditFamilyInfoScreen(),
    addfamilymember: (context) => const FamilyMembersScreen(),
    addrequest: (context) => const AddRequestScreen(),
    editrequest: (context) => const EditRequestScreen(),
    addfamilymember1: (context) => const AddFamilyMemberScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        if (settings.name == null) return const OnboardingPage();

        // Check if the route exists in our routes map
        final Widget? page = routes[settings.name]?.call(context);

        if (page == null) {
          // Return a 404-like error page or default page for unknown routes
          return Scaffold(
            body: Center(
              child: Text('Route ${settings.name} not found'),
            ),
          );
        }

        return page;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  static void navigateToHello(BuildContext context) {
    Navigator.pushNamed(context, hello);
  }

  static void navigateToHello2(BuildContext context) {
    Navigator.pushNamed(context, hello2);
  }

  static void navigateToAuth(BuildContext context) {
    Navigator.pushNamed(context, auth);
  }

  static void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, register);
  }

  static void navigateToOTP(BuildContext context) {
    Navigator.pushNamed(context, otp);
  }

  static void navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, signin);
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, home);
  }

  static void navigateToAddDoc(BuildContext context) {
    Navigator.pushNamed(context, adddoc);
  }

  static void navigateToEditFamilyInfo(BuildContext context) {
    Navigator.pushNamed(context, editfamilyinfo);
  }

  static void navigateToAddFamilyMember(BuildContext context) {
    Navigator.pushNamed(context, addfamilymember);
  }

  static void navigateToAddRequest(BuildContext context) {
    Navigator.pushNamed(context, addrequest);
  }

  static void navigateToEditRequest(BuildContext context) {
    Navigator.pushNamed(context, editrequest);
  }

  static void navigateAddFamilymember1(BuildContext context) {
    Navigator.pushNamed(context, addfamilymember1);
  }
}
