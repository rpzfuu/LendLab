import 'package:flutter/material.dart';
import 'package:lend_lab/app/screens/app_home_list_screen.dart';
import 'package:lend_lab/app/screens/app_home_screen.dart';
import 'package:lend_lab/app/screens/auth/login_auth_screen.dart';
import 'package:lend_lab/app/screens/auth/signup_auth_screen.dart';
import 'package:lend_lab/theme/app_colors.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 85,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentPageIndex,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: white,
          selectedItemColor: mainColor,
          unselectedItemColor: subtleBlue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_document),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          Navigator(
            initialRoute: '/app/home/list',
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case '/app/home':
                  return MaterialPageRoute(
                      builder: (context) => const HomePage());
                case '/app/home/list':
                  return MaterialPageRoute(
                      builder: (context) => const HomeListPage());
              }
              return null;
            },
          ),
          const LoginPage(),
          const SignupPage(),
          const HomePage(),
        ],
      ),
    );
  }
}
