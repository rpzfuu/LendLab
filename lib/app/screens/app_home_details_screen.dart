import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';

import 'package:lend_lab/app/widgets/list_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:lend_lab/app/services/getx_controller_service.dart';

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({super.key});

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  List<Map<String, dynamic>> dataPinjaman =
      Get.find<DataPinjamanController>().dataPinjaman;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataListUang = dataPinjaman.where((item) {
      return item['selesai'] == false && item['kategori'] == 'uang';
    }).toList();
    List<Map<String, dynamic>> dataListBarang = dataPinjaman.where((item) {
      return item['selesai'] == false && item['kategori'] == 'barang';
    }).toList();
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
                              physics: const ClampingScrollPhysics(),
                              children: List.generate(
                                dataListUang.length,
                                (index) => Column(
                                  children: [
                                    ListHomeDetailUang(
                                      nama: dataListUang[index]
                                          ['nama_peminjam'],
                                      tanggal: DateFormat('dd/MMM/yy').format(
                                          DateTime.parse(dataListUang[index]
                                              ['tanggal_meminjam'])),
                                      jumlah: dataListUang[index]['nilai'],
                                      dataPinjaman: dataListUang[index],
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
                                physics: const ClampingScrollPhysics(),
                                children: List.generate(
                                  dataListBarang.length,
                                  (index) => Column(
                                    children: [
                                      ListHomeDetailBarang(
                                        nama: dataListBarang[index]
                                            ['nama_peminjam'],
                                        tanggal: DateFormat('dd/MMM/yy').format(
                                            DateTime.parse(dataListBarang[index]
                                                ['tanggal_meminjam'])),
                                        barang: dataListBarang[index]['nilai'],
                                        dataPinjaman: dataListBarang[index],
                                      ),
                                      const SizedBox(height: 15),
                                      index + 1 != dataListBarang.length
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
