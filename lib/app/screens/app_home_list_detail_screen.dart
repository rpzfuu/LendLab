import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/widgets/button.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class HomeListDetailPage extends StatefulWidget {
  const HomeListDetailPage({super.key});

  @override
  State<HomeListDetailPage> createState() => _HomeListDetailPageState();
}

class _HomeListDetailPageState extends State<HomeListDetailPage> {
  final _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        final formattedDate = DateFormat('dd/MMM/yy').format(_selectedDate);
        _dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    Widget bottomWidget() {
      return Container(
        color: mainColor,
        width: mWidth,
        height: mHeight / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yakin mau dihapus?',
              style: TextStyles.lSemiBold.copyWith(color: white),
            ),
            const SizedBox(height: 5),
            Text(
              'Data mu akan hilang selamanya',
              style: TextStyles.mReguler.copyWith(color: white),
            ),
            const SizedBox(height: 20),
            Wrap(children: [
              ButtonBatal(
                  text: 'Batal',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(width: 10),
              ButtonHapus(text: 'Hapus', onPressed: () {})
            ]),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: black,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 15, 30, 30),
                              child: Column(
                                children: [
                                  const Text(
                                    'Peminjaman',
                                    style: TextStyles.xlSemiBold,
                                  ),
                                  Text(
                                    'Daftar Peminjaman',
                                    style: TextStyles.sReguler
                                        .copyWith(color: grey2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 160,
                      width: 300,
                      child: Image(
                        image:
                            AssetImage('lib/assets/images/splash_screen.png'),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nama Peminjam',
                        style: TextStyles.lSemiBold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 31,
                      child: TextFormField(
                        style: TextStyles.mReguler,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: (31 - 14) / 2 + 15),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Icon(
                              Icons.edit,
                              color: mainColor,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tanggal Pengembalian',
                        style: TextStyles.lSemiBold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 31,
                      child: TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _selectDate(context);
                        },
                        style: TextStyles.mReguler.copyWith(color: grey3),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: (31 - 14) / 2 + 15),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Icon(
                              Icons.date_range,
                              color: mainColor,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Jumlah Peminjaman',
                        style: TextStyles.lSemiBold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 31,
                      child: TextFormField(
                        style: TextStyles.mReguler,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: (31 - 14) / 2 + 15),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Icon(
                              Icons.edit,
                              color: mainColor,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                return bottomWidget();
                              });
                        },
                        child: Wrap(children: [
                          const Icon(
                            Icons.delete,
                            color: red,
                          ),
                          Text(
                            'Hapus',
                            style: TextStyles.lMedium.copyWith(color: red),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ButtonPrimary(text: 'Simpan Perubahan', onPressed: () {}),
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
