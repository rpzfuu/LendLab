import 'package:flutter/material.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/app/widgets/card_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarHistory(title: 'Riwayat'),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peminjaman Terakhir',
                      style: TextStyles.lSemiBold,
                    ),
                    CardHistory(),
                    CardHistory(),
                    CardHistory(),
                    CardHistory(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
