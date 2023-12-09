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
  Map<String, dynamic> dataUser = Get.find<UserController>().user;
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
    Get.put(DataPinjamanController());
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWelcome(
              nama: dataUser['first_name'] + ' ' + dataUser['last_name'],
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
                  FutureBuilder(
                    future: dataPinjaman,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final data = snapshot.data!;
                      Get.find<DataPinjamanController>()
                          .updatedataPinjaman(data);
                      List<Map<String, dynamic>> filterDataUang =
                          data.where((item) {
                        return item['kategori'] == 'uang' &&
                            item['selesai'] == false &&
                            (item['nama_peminjam']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()) ||
                                item['tanggal_meminjam']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()) ||
                                item['nilai']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()) ||
                                item['kategori']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()));
                      }).toList();
                      List<Map<String, dynamic>> filterDataBarang =
                          data.where((item) {
                        return item['kategori'] == 'barang' &&
                            item['selesai'] == false &&
                            (item['nama_peminjam']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()) ||
                                item['tanggal_meminjam']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()) ||
                                item['nilai']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()) ||
                                item['kategori']
                                    .toLowerCase()
                                    .contains(searchQuery.toLowerCase()));
                      }).toList();
                      return Column(
                        children: [
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
                                    physics: const ClampingScrollPhysics(),
                                    children: List.generate(
                                        filterDataUang.length,
                                        (index) => ListHomeUang(
                                            nama: filterDataUang[index]
                                                ['nama_peminjam'],
                                            tanggal: DateFormat('d MMM yyyy')
                                                .format(DateTime.parse(
                                                    filterDataUang[index]
                                                        ['tanggal_meminjam'])),
                                            jumlah: filterDataUang[index]
                                                ['nilai'])),
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
                                  ListView(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    children: List.generate(
                                        filterDataBarang.length,
                                        (index) => ListHomeBarang(
                                            nama: filterDataBarang[index]
                                                ['nama_peminjam'],
                                            tanggal: DateFormat('d MMM yyyy')
                                                .format(DateTime.parse(
                                                    filterDataBarang[index]
                                                        ['tanggal_meminjam'])),
                                            barang: filterDataBarang[index]
                                                ['nilai'])),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
