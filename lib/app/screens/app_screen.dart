import 'package:flutter/material.dart';
import 'package:lend_lab/app/services/getx_controller_service.dart';
import 'package:lend_lab/app/screens/app_history_screen.dart';

import 'package:lend_lab/app/screens/app_home_screen.dart';
import 'package:lend_lab/app/screens/app_profile_screen.dart';

import 'package:lend_lab/theme/app_colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int idUser = Get.find<UserController>().idUser.value;
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    int idUser = Get.find<UserController>().idUser.value;

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 85,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: currentPageIndex,
          onTap: (int index) {
            switch (index) {
              case 1:
                Navigator.pushNamed(context, '/app/add', arguments: idUser);
              default:
                setState(() {
                  currentPageIndex = index;
                });
            }
          },
          backgroundColor: white,
          selectedItemColor: mainColor,
          unselectedItemColor: subtleBlue,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.pencilPlus),
              label: 'Tambah',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.textBox),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.account),
              label: 'Profil',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomePage(),
          Placeholder(),
          HistoryPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
