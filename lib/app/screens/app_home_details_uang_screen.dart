import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/app/widgets/button_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class HomeDetailsUangPage extends StatefulWidget {
  final Map<String, dynamic> dataPinjaman;
  const HomeDetailsUangPage({super.key, required this.dataPinjaman});

  @override
  State<HomeDetailsUangPage> createState() => _HomeDetailsUangPageState();
}

class _HomeDetailsUangPageState extends State<HomeDetailsUangPage> {
  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();
  bool _isTerisi = false;
  void isTerisi() {
    bool temp = _namaController.text.isNotEmpty &&
        _jumlahController.text.isNotEmpty &&
        _dateController.text.isNotEmpty;
    setState(() {
      _isTerisi = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    _namaController.addListener(isTerisi);
    _jumlahController.addListener(isTerisi);
    _dateController.addListener(isTerisi);
  }

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
    Map<String, dynamic> dataPinjaman = widget.dataPinjaman;
    setState(() {
      _namaController.text = dataPinjaman['nama'];
      _dateController.text = dataPinjaman['tanggal'];
      _jumlahController.text = dataPinjaman['jumlah'].toString();
    });
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
              const AppBarNormal(
                text: 'Detail Peminjaman',
                subtext: 'Detail data peminjaman',
                routeBack: '/app/home/details',
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('lib/assets/images/add_uang.png'),
                    ),
                    const SizedBox(height: 25),
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
                        controller: _namaController,
                        style: TextStyles.mReguler,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: (31 - 14) / 2 + 15),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Icon(
                              Icons.edit,
                              color: mainColor,
                              size: 18,
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
                        controller: _jumlahController,
                        style: TextStyles.mReguler,
                        decoration: const InputDecoration(
                          prefixIcon: Text(
                            'Rp',
                            style: TextStyles.mReguler,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: (31 - 14) / 2 + 12),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Icon(
                              Icons.edit,
                              color: mainColor,
                              size: 18,
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
            isEnable: _isTerisi,
            text: 'Simpan Perubahan',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
