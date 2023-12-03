import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  String searchQuery = '';
  List<Map<String, dynamic>> dataListHistory = [
    {
      'id': 1,
      'nama': 'Yanto "Pasuruan" gempa bumi',
      'jumlah': '15000',
      'jenis': 'uang',
      'peminjaman': DateFormat('d MMM yyyy').format(DateTime.now()),
      'pengembalian': DateFormat('d MMM yyyy').format(DateTime.now()),
    },
    {
      'id': 2,
      'nama': 'Fuad 12 nyapu di "Kebun Raya Bogor"',
      'jumlah': 'Celana Mas Mursyid',
      'jenis': 'barang',
      'peminjaman': DateFormat('d MMM yyyy').format(DateTime.now()),
      'pengembalian': DateFormat('d MMM yyyy').format(DateTime.now()),
    },
    {
      'id': 3,
      'nama': 'Ryan parmadi dancer Pekalongan',
      'jumlah': '30000',
      'jenis': 'uang',
      'peminjaman': DateFormat('d MMM yyyy').format(DateTime.now()),
      'pengembalian': DateFormat('d MMM yyyy').format(DateTime.now()),
    },
    {
      'id': 4,
      'nama': 'Dadang resing jagoan sirkuit Sentul',
      'jumlah': 'Knalpot Mas Rusdi',
      'jenis': 'barang',
      'peminjaman': DateFormat('d MMM yyyy').format(DateTime.now()),
      'pengembalian': DateFormat('d MMM yyyy').format(DateTime.now()),
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredDataListHistory =
        dataListHistory.where((item) {
      return item['nama'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          item['jumlah'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          item['jenis'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          item['peminjaman']
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item['pengembalian']
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
    }).toList();
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
                    ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        filteredDataListHistory.length,
                        (index) => CardHistory(
                          nama: filteredDataListHistory[index]['nama'],
                          jumlah: filteredDataListHistory[index]['jumlah'],
                          jenis: filteredDataListHistory[index]['jenis'],
                          peminjaman: filteredDataListHistory[index]
                              ['peminjaman'],
                          pengembalian: filteredDataListHistory[index]
                              ['pengembalian'],
                        ),
                      ),
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
