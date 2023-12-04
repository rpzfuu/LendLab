import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';

import 'package:lend_lab/app/widgets/list_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({super.key});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  List<Map<String, dynamic>> dataListUang = [
    {
      'id': 1,
      'nama': 'Yanto "Pasuruan" gempa bumi',
      'tanggal': DateFormat('d MMM yyyy').format(DateTime.now()),
      'jumlah': 50000
    },
    {
      'id': 2,
      'nama': 'Pace Kanaeru',
      'tanggal': DateFormat('d MMM yyyy').format(DateTime.now()),
      'jumlah': 20000
    },
    {
      'id': 3,
      'nama': 'Wak Abdul Sungai Musi',
      'tanggal': DateFormat('d MMM yyyy').format(DateTime.now()),
      'jumlah': 100000
    },
  ];
  List<Map<String, dynamic>> dataListBarang = [
    {
      'id': 1,
      'nama': 'Mas Amba',
      'tanggal': DateFormat('d MMM yyyy').format(DateTime.now()),
      'barang': 'Handuk Mas Fuad'
    },
    {
      'id': 2,
      'nama': 'Mas Rusdi',
      'tanggal': DateFormat('d MMM yyyy').format(DateTime.now()),
      'barang': 'Baju Si Imut'
    },
    {
      'id': 3,
      'nama': 'Pak Asep',
      'tanggal': DateFormat('d MMM yyyy').format(DateTime.now()),
      'barang': 'Celana Mas Mursyid'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarNormal(
                text: 'Peminjaman',
                subtext: 'Daftar Peminjaman',
                routeBack: '/app',
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Uang',
                              style: TextStyles.mMedium,
                            ),
                            const SizedBox(height: 20),
                            ListView(
                              shrinkWrap: true,
                              children: List.generate(
                                dataListUang.length,
                                (index) => Column(
                                  children: [
                                    ListHomeDetailUang(
                                      nama: dataListUang[index]['nama'],
                                      tanggal: dataListUang[index]['tanggal'],
                                      jumlah: dataListUang[index]['jumlah'],
                                      dataPinjaman: dataListBarang[index],
                                    ),
                                    const SizedBox(height: 15),
                                    index + 1 != dataListUang.length
                                        ? const Divider(
                                            height: 1,
                                            color: grey1,
                                          )
                                        : const SizedBox(),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Barang',
                                style: TextStyles.mMedium,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(height: 20),
                              ListView(
                                shrinkWrap: true,
                                children: List.generate(
                                  dataListBarang.length,
                                  (index) => Column(
                                    children: [
                                      ListHomeDetailBarang(
                                        nama: dataListBarang[index]['nama'],
                                        tanggal: dataListBarang[index]
                                            ['tanggal'],
                                        barang: dataListBarang[index]['barang'],
                                        dataPinjaman: dataListBarang[index],
                                      ),
                                      const SizedBox(height: 15),
                                      index + 1 != dataListUang.length
                                          ? const Divider(
                                              height: 1,
                                              color: grey1,
                                            )
                                          : const SizedBox(),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
