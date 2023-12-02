import 'package:flutter/material.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class ListHomeUang extends StatelessWidget {
  final String nama;
  final String tanggal;
  final int jumlah;
  const ListHomeUang(
      {super.key,
      required this.nama,
      required this.tanggal,
      required this.jumlah});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 47,
                  width: 52,
                  child: Image(
                    image: AssetImage('lib/assets/images/uang.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama),
                Wrap(
                  children: [
                    Text(
                      tanggal,
                      style: TextStyles.sMedium.copyWith(color: red),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp $jumlah',
                  style: TextStyles.sMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListHomeBarang extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String barang;
  const ListHomeBarang(
      {super.key,
      required this.nama,
      required this.tanggal,
      required this.barang});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 47,
                  width: 52,
                  child: Image(
                    image: AssetImage('lib/assets/images/barang.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama),
                Wrap(
                  children: [
                    Text(
                      tanggal,
                      style: TextStyles.sMedium.copyWith(color: red),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  barang,
                  style: TextStyles.sMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
