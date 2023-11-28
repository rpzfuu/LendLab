import 'package:flutter/material.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class AppBarNormal extends StatelessWidget {
  final String text;
  final String subtext;
  const AppBarNormal({super.key, required this.text, required this.subtext});

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
