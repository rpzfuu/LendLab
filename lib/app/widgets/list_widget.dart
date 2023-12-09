import 'package:flutter/material.dart';
import 'package:lend_lab/app/services/supabase_handler_service.dart';
import 'package:lend_lab/app/widgets/button_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class ListHomeUang extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String jumlah;
  const ListHomeUang(
      {super.key,
      required this.nama,
      required this.tanggal,
      required this.jumlah});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 47,
                  width: 52,
                  child: Image(
                    image: AssetImage('lib/assets/images/uang.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama),
                Wrap(
                  children: [
                    Text(
                      tanggal,
                      style: TextStyles.sMedium.copyWith(color: red),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp $jumlah',
                  style: TextStyles.sMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListHomeBarang extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String barang;
  const ListHomeBarang(
      {super.key,
      required this.nama,
      required this.tanggal,
      required this.barang});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 47,
                  width: 52,
                  child: Image(
                    image: AssetImage('lib/assets/images/barang.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama),
                Wrap(
                  children: [
                    Text(
                      tanggal,
                      style: TextStyles.sMedium.copyWith(color: red),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  barang,
                  style: TextStyles.sMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListHomeDetailUang extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String jumlah;
  final Map dataPinjaman;

  const ListHomeDetailUang(
      {super.key,
      required this.nama,
      required this.tanggal,
      required this.jumlah,
      required this.dataPinjaman});

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
              'Apakah barangnya sudah dikembalikan?',
              style: TextStyles.lSemiBold.copyWith(color: white),
            ),
            const SizedBox(height: 5),
            Text(
              'Data pinjamannya akan ditempatkan di halaman riwayat',
              style: TextStyles.mReguler.copyWith(color: white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Wrap(
              children: [
                ButtonBatal(
                    text: 'Batal',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(width: 10),
                ButtonHapus(
                  text: 'Selesaikan',
                  onPressed: () async {
                    final supabase = SupaBaseHandler();
                    await supabase
                        .selesaikanPinjaman(dataPinjaman['id_pinjaman']);
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/app', (route) => false);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Peminjaman Berhasil Diselesaikan'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/app/home/details/uang',
          (route) => false,
          arguments: dataPinjaman,
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 47,
                width: 52,
                child: Image(
                  image: AssetImage('lib/assets/images/uang.png'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nama),
                    Wrap(
                      children: [
                        Text(
                          tanggal,
                          style: TextStyles.sMedium.copyWith(color: red),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rp $jumlah',
                      style: TextStyles.sMedium,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Menunggu Pengembalian',
                  style: TextStyles.sMedium.copyWith(color: grey3),
                ),
              ),
              ButtonSelesai(
                text: 'Selesaikan',
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return bottomWidget();
                      });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListHomeDetailBarang extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String barang;
  final Map dataPinjaman;

  const ListHomeDetailBarang(
      {super.key,
      required this.nama,
      required this.tanggal,
      required this.dataPinjaman,
      required this.barang});

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
              'Apakah barangnya sudah dikembalikan?',
              style: TextStyles.lSemiBold.copyWith(color: white),
            ),
            const SizedBox(height: 5),
            Text(
              'Data pinjamannya akan ditempatkan di halaman riwayat',
              style: TextStyles.mReguler.copyWith(color: white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Wrap(children: [
              ButtonBatal(
                  text: 'Batal',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(width: 10),
              ButtonHapus(
                text: 'Selesaikan',
                onPressed: () async {
                  final supabase = SupaBaseHandler();
                  await supabase
                      .selesaikanPinjaman(dataPinjaman['id_pinjaman']);
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/app', (route) => false);
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Peminjaman Berhasil Diselesaikan'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              )
            ]),
          ],
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/app/home/details/barang',
          (route) => false,
          arguments: dataPinjaman,
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 47,
                width: 52,
                child: Image(
                  image: AssetImage('lib/assets/images/barang.png'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nama),
                    Wrap(
                      children: [
                        Text(
                          tanggal,
                          style: TextStyles.sMedium.copyWith(color: red),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      barang,
                      style: TextStyles.sMedium,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Menunggu Pengembalian',
                  style: TextStyles.sMedium.copyWith(color: grey3),
                ),
              ),
              ButtonSelesai(
                text: 'Selesaikan',
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return bottomWidget();
                      });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
