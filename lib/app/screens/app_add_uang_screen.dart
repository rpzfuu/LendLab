import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/app/widgets/button_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class AddUangPage extends StatefulWidget {
  const AddUangPage({super.key});

  @override
  State<AddUangPage> createState() => _AddUangPageState();
}

class _AddUangPageState extends State<AddUangPage> {
  final _namaPeminjamController = TextEditingController();
  final _namaNilaiController = TextEditingController();
  final _dateController = TextEditingController();
  bool terisi = false;
  void isTerisi() {
    bool temp = _namaNilaiController.text.isNotEmpty &&
        _namaPeminjamController.text.isNotEmpty &&
        _dateController.text.isNotEmpty;
    setState(() {
      terisi = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    _namaNilaiController.addListener(isTerisi);
    _namaPeminjamController.addListener(isTerisi);
    _dateController.addListener(isTerisi);
  }

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

  List<bool> _pilihCepat = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
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
                text: 'Tambahkan Peminjaman',
                subtext: 'Isi detail peminjaman',
                routeBack: '/app/add',
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 39,
                      child: TextFormField(
                        controller: _namaPeminjamController,
                        style: TextStyles.lSemiBold,
                        decoration: const InputDecoration(
                          hintText: 'Nama Peminjam',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: (39 - 16) / 2 + 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tanggal Meminjam',
                        style: TextStyles.lMedium,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 42,
                      child: TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _selectDate(context);
                        },
                        style: TextStyles.mReguler.copyWith(color: grey3),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: (42 - 14) / 2, horizontal: 10),
                          suffixIcon: const Icon(
                            Icons.date_range,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      height: 39,
                      child: TextFormField(
                        controller: _namaNilaiController,
                        style: TextStyles.lSemiBold,
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          prefixIcon: Text(
                            'Rp',
                            style: TextStyles.lSemiBold,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: (39 - 16) / 2 + 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jumlah',
                            style: TextStyles.lMedium,
                          ),
                          const Text(
                            'Tambahkan dengan cepat',
                            style: TextStyles.sReguler,
                          ),
                          const SizedBox(height: 30),
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              ButtonCepat(
                                text: '10.000',
                                pilih: _pilihCepat[0],
                                onPressed: () {
                                  setState(() {
                                    if (_pilihCepat[0]) {
                                      terisi = false;
                                      _pilihCepat[0] = false;
                                      _namaNilaiController.clear();
                                    } else {
                                      _pilihCepat = List.filled(
                                          _pilihCepat.length, false);
                                      _pilihCepat[0] = true;
                                      terisi = true;
                                      _namaNilaiController.text = '10000';
                                    }
                                  });
                                },
                              ),
                              ButtonCepat(
                                text: '30.000',
                                pilih: _pilihCepat[1],
                                onPressed: () {
                                  setState(() {
                                    if (_pilihCepat[1]) {
                                      _pilihCepat[1] = false;
                                      terisi = false;
                                      _namaNilaiController.clear();
                                    } else {
                                      _pilihCepat = List.filled(
                                          _pilihCepat.length, false);
                                      _pilihCepat[1] = true;
                                      terisi = true;
                                      _namaNilaiController.text = '30000';
                                    }
                                  });
                                },
                              ),
                              ButtonCepat(
                                text: '50.000',
                                pilih: _pilihCepat[2],
                                onPressed: () {
                                  setState(() {
                                    if (_pilihCepat[2]) {
                                      _pilihCepat[2] = false;
                                      terisi = false;
                                      _namaNilaiController.clear();
                                    } else {
                                      _pilihCepat = List.filled(
                                          _pilihCepat.length, false);
                                      _pilihCepat[2] = true;
                                      terisi = true;
                                      _namaNilaiController.text = '50000';
                                    }
                                  });
                                },
                              ),
                              ButtonCepat(
                                text: '100.000',
                                pilih: _pilihCepat[3],
                                onPressed: () {
                                  setState(() {
                                    if (_pilihCepat[3]) {
                                      _pilihCepat[3] = false;
                                      terisi = false;
                                      _namaNilaiController.clear();
                                    } else {
                                      _pilihCepat = List.filled(
                                          _pilihCepat.length, false);
                                      _pilihCepat[3] = true;
                                      terisi = true;
                                      _namaNilaiController.text = '100000';
                                    }
                                  });
                                },
                              ),
                              ButtonCepat(
                                text: '500.000',
                                pilih: _pilihCepat[4],
                                onPressed: () {
                                  setState(() {
                                    if (_pilihCepat[4]) {
                                      _pilihCepat[4] = false;
                                      terisi = false;
                                      _namaNilaiController.clear();
                                    } else {
                                      _pilihCepat = List.filled(
                                          _pilihCepat.length, false);
                                      _pilihCepat[4] = true;
                                      terisi = true;
                                      _namaNilaiController.text = '500000';
                                    }
                                  });
                                },
                              ),
                              ButtonCepat(
                                text: '1.000.000',
                                pilih: _pilihCepat[5],
                                onPressed: () {
                                  setState(() {
                                    if (_pilihCepat[5]) {
                                      _pilihCepat[5] = false;
                                      terisi = false;
                                      _namaNilaiController.clear();
                                    } else {
                                      _pilihCepat = List.filled(
                                          _pilihCepat.length, false);
                                      _pilihCepat[5] = true;
                                      terisi = true;
                                      _namaNilaiController.text = '1000000';
                                    }
                                  });
                                },
                              ),
                              ButtonCepat(
                                  text: '1.500.000',
                                  pilih: _pilihCepat[6],
                                  onPressed: () {
                                    setState(() {
                                      if (_pilihCepat[6]) {
                                        _pilihCepat[6] = false;
                                        terisi = false;
                                        _namaNilaiController.clear();
                                      } else {
                                        _pilihCepat = List.filled(
                                            _pilihCepat.length, false);
                                        _pilihCepat[6] = true;
                                        terisi = true;
                                        _namaNilaiController.text = '1500000';
                                      }
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 40),
        child: BottomAppBar(
          child: ButtonPrimary(
            isEnable: terisi,
            text: 'Lanjutkan',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/app/add/success', (route) => false);
            },
          ),
        ),
      ),
    );
  }
}
