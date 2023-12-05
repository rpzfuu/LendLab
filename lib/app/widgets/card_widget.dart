import 'package:flutter/material.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class CardHistory extends StatelessWidget {
  final String nama;
  final String jumlah;
  final String jenis;
  final String peminjaman;
  final String pengembalian;
  const CardHistory(
      {super.key,
      required this.nama,
      required this.jumlah,
      required this.jenis,
      required this.peminjaman,
      required this.pengembalian});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15),
      color: mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 2, 2),
        child: Container(
          decoration: const BoxDecoration(
            color: background,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Image.asset(
                        jenis == 'uang'
                            ? 'lib/assets/images/gambar_uang.png'
                            : 'lib/assets/images/barang.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama,
                            style: TextStyles.sMedium
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            jenis == 'uang' ? 'Rp $jumlah' : jumlah,
                            style: TextStyles.sMedium
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 10),
                        decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          'Selesai',
                          style: TextStyles.xsReguler.copyWith(color: white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Peminjaman',
                      style: TextStyles.sMedium.copyWith(color: grey5),
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Pengembalian',
                          style: TextStyles.sMedium.copyWith(color: grey5),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      peminjaman,
                      style: TextStyles.sReguler.copyWith(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        pengembalian,
                        style:
                            TextStyles.sReguler.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
