import 'package:flutter/material.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class AppBarNormal extends StatelessWidget {
  final String text;
  final String subtext;
  final String routeBack;

  const AppBarNormal(
      {super.key,
      required this.text,
      required this.subtext,
      required this.routeBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, routeBack);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: TextStyles.xlSemiBold,
                        ),
                        subtext.isNotEmpty
                            ? Text(
                                subtext,
                                style:
                                    TextStyles.sReguler.copyWith(color: grey2),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarWelcome extends StatelessWidget {
  final String nama;
  final ValueChanged<String> onChanged;
  const AppBarWelcome({required this.nama, super.key, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, $nama',
                      style: TextStyles.xlSemiBold,
                    ),
                    Text(
                      'Welcome!',
                      style: TextStyles.sReguler.copyWith(color: grey2),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(
                    image: AssetImage("lib/assets/images/profil_kosong.png"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 42,
            child: TextFormField(
              onChanged: onChanged,
              style: TextStyles.mReguler.copyWith(color: black),
              decoration: InputDecoration(
                hintStyle: TextStyles.mReguler.copyWith(color: grey2),
                hintText: 'Cari sesuatu',
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarHistory extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChanged;
  const AppBarHistory(
      {super.key, required this.title, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: ModalRoute.of(context)?.settings.name != '/app'
                        ? () {
                            Navigator.pop(context);
                          }
                        : () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/app', (route) => false);
                          },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyles.lSemiBold.copyWith(color: black),
                  ),
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.tune,
                        color: mainColor,
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              height: 42,
              child: TextFormField(
                onChanged: onChanged,
                style: TextStyles.mReguler.copyWith(color: black),
                decoration: InputDecoration(
                  hintStyle: TextStyles.mReguler.copyWith(color: grey2),
                  hintText: 'Cari peminjaman',
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
