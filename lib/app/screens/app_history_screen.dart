import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/services/supabase_handler_service.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/app/widgets/card_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';
import 'package:lend_lab/app/services/getx_controller_service.dart';
import 'package:get/get.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int idUser = Get.find<UserController>().idUser.value;
  final supabase = SupaBaseHandler();
  late Future<List<Map<String, dynamic>>> dataPinjaman;

  @override
  void initState() {
    super.initState();
    dataPinjaman = supabase.dataPinjamanUser(idUser);
  }

  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarHistory(
                title: 'Riwayat',
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Peminjaman Terakhir',
                      style: TextStyles.lSemiBold,
                    ),
                    FutureBuilder(
                      future: dataPinjaman,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final data = snapshot.data!;
                        List<Map<String, dynamic>> dataListHistory =
                            data.where((item) {
                          return item['selesai'] == true &&
                              (item['nama_peminjam']
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()) ||
                                  item['nilai']
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()) ||
                                  item['kategori']
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()) ||
                                  item['tanggal_meminjam']
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()) ||
                                  item['tanggal_pengembalian']
                                      .toLowerCase()
                                      .contains(searchQuery.toLowerCase()));
                        }).toList();

                        return ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: List.generate(
                            dataListHistory.length,
                            (index) => CardHistory(
                              nama: dataListHistory[index]['nama_peminjam'],
                              jumlah: dataListHistory[index]['nilai'],
                              jenis: dataListHistory[index]['kategori'],
                              peminjaman: DateFormat('d MMM yyyy').format(
                                  DateTime.parse(dataListHistory[index]
                                      ['tanggal_meminjam'])),
                              pengembalian: DateFormat('d MMM yyyy').format(
                                  DateTime.parse(dataListHistory[index]
                                      ['tanggal_pengembalian'])),
                            ),
                          ),
                        );
                      },
                    ),
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
