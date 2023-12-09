import 'package:flutter/material.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/app/widgets/button_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  bool _pilihUang = false;
  bool _pilihBarang = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarNormal(
                text: 'Pilih Jenis Peminjaman',
                subtext: 'Pilih jenis peminjaman yang sesuai',
                routeBack: '/app',
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: _pilihUang ? mainColor : background)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: SizedBox(
                                height: 150,
                                width: 280,
                                child: Image(
                                    image: AssetImage(
                                        'lib/assets/images/add_uang.png')),
                              ),
                            ),
                            const Text(
                              'Uang',
                              style: TextStyles.lMedium,
                            ),
                            Text(
                              'Min Peminjaman Rp 1000',
                              style: TextStyles.sReguler.copyWith(color: grey2),
                            ),
                            const SizedBox(height: 15),
                            ButtonPilih(
                                text: 'Pilih',
                                onPressed: () {
                                  setState(() {
                                    if (_pilihBarang) {
                                      _pilihBarang = false;
                                      _pilihUang = true;
                                    } else {
                                      _pilihUang = true;
                                    }
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: _pilihBarang ? mainColor : background),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: SizedBox(
                                height: 150,
                                width: 280,
                                child: Image(
                                    image: AssetImage(
                                        'lib/assets/images/add_barang.png')),
                              ),
                            ),
                            const Text(
                              'Barang',
                              style: TextStyles.lMedium,
                            ),
                            Text(
                              'Catat berbagai barang yang dipinjam',
                              style: TextStyles.sReguler.copyWith(color: grey2),
                            ),
                            const SizedBox(height: 15),
                            ButtonPilih(
                                text: 'Pilih',
                                onPressed: () {
                                  setState(() {
                                    if (_pilihUang) {
                                      _pilihBarang = true;
                                      _pilihUang = false;
                                    } else {
                                      _pilihBarang = true;
                                    }
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 40),
        child: BottomAppBar(
          child: ButtonPrimary(
            isEnable: _pilihBarang || _pilihUang,
            text: 'Lanjutkan',
            onPressed: () {
              if (_pilihUang) Navigator.pushNamed(context, '/app/add/uang');
              if (_pilihBarang) Navigator.pushNamed(context, '/app/add/barang');
            },
          ),
        ),
      ),
    );
  }
}
