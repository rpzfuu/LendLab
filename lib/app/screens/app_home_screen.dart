import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/services/supabase_handler_service.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/app/widgets/list_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:lend_lab/app/services/getx_controller_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int idUser = Get.find<UserController>().idUser.value;
  final supabase = SupaBaseHandler();

  late Future<List<Map<String, dynamic>>> dataPinjaman;
  @override
  void initState() {
    super.initState();
    dataPinjaman = supabase.dataPinjamanUser(idUser);
  }

  String searchQuery = '';

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
    final dataUser = supabase.dataUser(idUser);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: dataUser,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final data = snapshot.data!;
                String namaUser = data['first_name'] + ' ' + data['last_name'];
                return AppBarWelcome(
                  nama: namaUser,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                );
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
                            Navigator.pushNamed(context, '/app/home/details');
                          },
                          child: const Text(
                            'Detail',
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
                          FutureBuilder(
                            future: dataPinjaman,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final data = snapshot.data!;
                              List<Map<String, dynamic>> filterData =
                                  data.where((item) {
                                return item['kategori'] == 'uang' &&
                                    (item['nama_peminjam']
                                            .toLowerCase()
                                            .contains(
                                                searchQuery.toLowerCase()) ||
                                        item['tanggal_meminjam']
                                            .toLowerCase()
                                            .contains(
                                                searchQuery.toLowerCase()) ||
                                        item['nilai'].toLowerCase().contains(
                                            searchQuery.toLowerCase()) ||
                                        item['kategori'].toLowerCase().contains(
                                            searchQuery.toLowerCase()));
                              }).toList();
                              return ListView(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                children: List.generate(
                                    filterData.length,
                                    (index) => ListHomeUang(
                                        nama: filterData[index]
                                            ['nama_peminjam'],
                                        tanggal: DateFormat('d MMM yyyy')
                                            .format(DateTime.parse(
                                                filterData[index]
                                                    ['tanggal_meminjam'])),
                                        jumlah: filterData[index]['nilai'])),
                              );
                            },
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
                            FutureBuilder(
                              future: dataPinjaman,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                final data = snapshot.data!;
                                List<Map<String, dynamic>> filterData =
                                    data.where((item) {
                                  return item['kategori'] == 'barang' &&
                                      (item['nama_peminjam']
                                              .toLowerCase()
                                              .contains(
                                                  searchQuery.toLowerCase()) ||
                                          item['tanggal_meminjam']
                                              .toLowerCase()
                                              .contains(
                                                  searchQuery.toLowerCase()) ||
                                          item['nilai'].toLowerCase().contains(
                                              searchQuery.toLowerCase()) ||
                                          item['kategori']
                                              .toLowerCase()
                                              .contains(
                                                  searchQuery.toLowerCase()));
                                }).toList();
                                return ListView(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  children: List.generate(
                                      filterData.length,
                                      (index) => ListHomeBarang(
                                          nama: filterData[index]
                                              ['nama_peminjam'],
                                          tanggal: DateFormat('d MMM yyyy')
                                              .format(DateTime.parse(
                                                  filterData[index]
                                                      ['tanggal_meminjam'])),
                                          barang: filterData[index]['nilai'])),
                                );
                              },
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
