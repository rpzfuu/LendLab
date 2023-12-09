import 'package:flutter/material.dart';
import 'package:lend_lab/app/screens/app_add_barang_screen.dart';
import 'package:lend_lab/app/screens/app_add_screen.dart';
import 'package:lend_lab/app/screens/app_add_success_screen.dart';
import 'package:lend_lab/app/screens/app_add_uang_screen.dart';
import 'package:lend_lab/app/screens/app_history_screen.dart';
import 'package:lend_lab/app/screens/app_home_details_barang_screen.dart';

import 'package:lend_lab/app/screens/app_home_details_screen.dart';
import 'package:lend_lab/app/screens/app_home_details_uang_screen.dart';
import 'package:lend_lab/app/screens/app_profile_screen.dart';
import 'package:lend_lab/app/screens/auth/login_auth_screen.dart';
import 'package:lend_lab/app/screens/auth/signup_auth_screen.dart';
import 'package:lend_lab/app/screens/app_screen.dart';
import 'package:lend_lab/app/screens/splash_screen.dart';
import 'package:lend_lab/app/services/getx_controller_service.dart';
import 'package:lend_lab/app/services/supabase_handler_service.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final handler = SupaBaseHandler();
  await Supabase.initialize(
    url: handler.GetURL(),
    anonKey: handler.GetKey(),
  );
  Get.put(UserController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: mainColor),
      ),
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/app':
            {
              final int value = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => AppPage(idUser: value),
              );
            }
          case '/app/add':
            {
              final int value = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => AddPage(idUser: value),
              );
            }
          case '/app/home/details/uang':
            {
              final Map<String, dynamic> dataPinjaman =
                  settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) {
                  return HomeDetailsUangPage(dataPinjaman: dataPinjaman);
                },
              );
            }
          case '/app/home/details/barang':
            {
              final Map<String, dynamic> dataPinjaman =
                  settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) {
                  return HomeDetailsBarangPage(dataPinjaman: dataPinjaman);
                },
              );
            }
        }
        return null;
      },
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        // '/app': (context) => const AppPage(),
        // '/app/home': (context) => const HomePage(),
        '/app/home/details': (context) => const HomeDetailsPage(),
        // '/app/home/details/uang': (context) => const HomeDetailsUangPage(),
        // '/app/home/details/barang': (context) => const HomeDetailsBarangPage(),
        // '/app/add': (context) => const AddPage(),
        '/app/add/uang': (context) => const AddUangPage(),
        '/app/add/barang': (context) => const AddBarangPage(),
        '/app/add/success': (context) => const AddSuccessPage(),
        '/app/profile': (context) => const ProfilePage(),
        '/app/history': (context) => const HistoryPage(),
      },
    );
  }
}
