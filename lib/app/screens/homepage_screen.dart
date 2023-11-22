import 'package:flutter/material.dart';
import 'package:lend_lab/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Container(child: const Text('1')),
          Container(child: const Text('2')),
          Container(child: const Text('3')),
          Container(child: const Text('4')),
        ],
      ),
    );
  }
}
