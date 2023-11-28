import 'package:flutter/material.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarNormal(text: 'Profile', subtext: ''),
            Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 75,
                                width: 75,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'Felicia',
                                  style: TextStyles.xlSemiBold
                                      .copyWith(color: black),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: grey2))),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          padding: const EdgeInsets.all(0),
                          side: const BorderSide(
                            width: 0.0,
                            style: BorderStyle.none,
                          ),
                        ),
                        child: Row(children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Pengaturan',
                              style: TextStyles.mMedium.copyWith(color: black),
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: black,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: grey2))),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/splash', (route) => false);
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          padding: const EdgeInsets.all(0),
                          side: const BorderSide(
                            width: 0.0,
                            style: BorderStyle.none,
                          ),
                        ),
                        child: Row(children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Keluar',
                              style: TextStyles.mMedium.copyWith(color: black),
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.logout,
                                size: 20,
                                color: black,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
