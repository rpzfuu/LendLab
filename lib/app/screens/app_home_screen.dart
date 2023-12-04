import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/app/widgets/list_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
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
    List<Map<String, dynamic>> filteredDataListUang =
        dataListUang.where((item) {
      return item['nama'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          item['tanggal'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          item['jumlah'].toString().contains(searchQuery);
    }).toList();
    List<Map<String, dynamic>> filteredDataListBarang =
        dataListBarang.where((item) {
      return item['nama'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          item['tanggal'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          item['barang'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWelcome(
              nama: 'Felicia',
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 5,
                        child: Text(
                          'Peminjaman Terakhir',
                          style: TextStyles.lSemiBold,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              alignment: Alignment.centerRight),
                          onPressed: () {
                            Navigator.pushNamed(context, '/app/home/list');
                          },
                          child: const Text(
                            'Details',
                            style: TextStyles.sMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Uang',
                              style: TextStyles.mMedium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              height: 1,
                              color: grey1,
                            ),
                            ListView(
                              shrinkWrap: true,
                              children: List.generate(
                                filteredDataListUang.length,
                                (index) => ListHomeUang(
                                  nama: filteredDataListUang[index]['nama'],
                                  tanggal: filteredDataListUang[index]
                                      ['tanggal'],
                                  jumlah: filteredDataListUang[index]['jumlah'],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Barang',
                              style: TextStyles.mMedium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              height: 1,
                              color: grey1,
                            ),
                            ListView(
                              shrinkWrap: true,
                              children: List.generate(
                                filteredDataListBarang.length,
                                (index) => ListHomeBarang(
                                  nama: filteredDataListBarang[index]['nama'],
                                  tanggal: filteredDataListBarang[index]
                                      ['tanggal'],
                                  barang: filteredDataListBarang[index]
                                      ['barang'],
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
      )),
    );
  }
}
