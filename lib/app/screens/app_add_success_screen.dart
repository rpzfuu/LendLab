import 'package:flutter/material.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class AddSuccessPage extends StatefulWidget {
  const AddSuccessPage({super.key});

  @override
  State<AddSuccessPage> createState() => _AddSuccessPageState();
}

class _AddSuccessPageState extends State<AddSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(49, 0, 49, 60),
              child: SizedBox(
                height: 278,
                width: 278,
                child: Image(
                    image: AssetImage('lib/assets/images/splash_screen.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 57.5),
              child: Text(
                'Peminjaman Ditambahkan!',
                style: TextStyles.lSemiBold.copyWith(color: white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: Column(
                children: [
                  Text(
                    'Jangan lupa cek daftar ',
                    style: TextStyles.lReguler.copyWith(color: white),
                  ),
                  Text(
                    'pinjaman mu ya!',
                    style: TextStyles.lReguler.copyWith(color: white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/app', (route) => false);
                },
                child: Text(
                  'Kembali',
                  style: TextStyles.xlSemiBold.copyWith(color: mainColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
