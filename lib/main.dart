import 'package:flutter/material.dart';
import 'package:lend_lab/app/screens/app_home_list_screen.dart';
import 'package:lend_lab/app/screens/app_home_screen.dart';
import 'package:lend_lab/app/screens/auth/login_auth_screen.dart';
import 'package:lend_lab/app/screens/auth/signup_auth_screen.dart';
import 'package:lend_lab/app/screens/app_screen.dart';
import 'package:lend_lab/app/screens/splash_screen.dart';
import 'package:lend_lab/theme/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: mainColor),
      ),
      initialRoute: '/app',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/app': (context) => const AppPage(),
        '/app/home': (context) => const HomePage(),
        '/app/home/list': (context) => const HomeListPage(),
      },
    );
  }
}
