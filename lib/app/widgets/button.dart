import 'package:flutter/material.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnable;

  const ButtonPrimary(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isEnable});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: mainColor,
          minimumSize: const Size(double.infinity, 55),
          disabledBackgroundColor: grey4,
        ),
        onPressed: isEnable ? onPressed : null,
        child: Text(text, style: TextStyles.lSemiBold.copyWith(color: white)));
  }
}

class ButtonPilih extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonPilih({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: mainColor,
          minimumSize: const Size(double.infinity, 40),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.sMedium));
  }
}

class ButtonSelesai extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonSelesai({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: mainColor,
          minimumSize: const Size(110, 40),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.sMedium));
  }
}

class ButtonBatal extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonBatal({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: subtleBlue,
          minimumSize: const Size(150, 60),
        ),
        onPressed: onPressed,
        child:
            Text(text, style: TextStyles.lMedium.copyWith(color: mainColor)));
  }
}

class ButtonHapus extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonHapus({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          minimumSize: const Size(150, 60),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.lMedium.copyWith(color: white)));
  }
}

class ButtonCepat extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool pilih;

  const ButtonCepat(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.pilih});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: pilih ? mainColor : background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: pilih ? background : grey1),
        minimumSize: const Size(0, 38),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.sMedium.copyWith(color: pilih ? white : darkergrey),
      ),
    );
  }
}
