import 'package:flutter/material.dart';
import 'package:lend_lab/app/widgets/appbar_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarWelcome(nama: 'Felicia'),
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
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 47,
                                        width: 52,
                                        child: Image(
                                          image: AssetImage(
                                              'lib/assets/images/uang.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Meri Ngutang'),
                                      Wrap(
                                        children: [
                                          Text(
                                            '17 Sep 2023',
                                            style: TextStyles.sMedium
                                                .copyWith(color: red),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Rp 500.000',
                                        style: TextStyles.sMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 47,
                                        width: 52,
                                        child: Image(
                                          image: AssetImage(
                                              'lib/assets/images/uang.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Meri Ngutang'),
                                      Wrap(
                                        children: [
                                          Text(
                                            '17 Sep 2023',
                                            style: TextStyles.sMedium
                                                .copyWith(color: red),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Rp 500.000',
                                        style: TextStyles.sMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
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
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 47,
                                        width: 52,
                                        child: Image(
                                          image: AssetImage(
                                              'lib/assets/images/barang.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Dina Minjam Baju'),
                                      Wrap(
                                        children: [
                                          Text(
                                            '20 Sep 2023',
                                            style: TextStyles.sMedium
                                                .copyWith(color: red),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Barang',
                                        style: TextStyles.sMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 47,
                                        width: 52,
                                        child: Image(
                                          image: AssetImage(
                                              'lib/assets/images/barang.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Dina Minjam Baju'),
                                      Wrap(
                                        children: [
                                          Text(
                                            '20 Sep 2023',
                                            style: TextStyles.sMedium
                                                .copyWith(color: red),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Barang',
                                        style: TextStyles.sMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 47,
                                        width: 52,
                                        child: Image(
                                          image: AssetImage(
                                              'lib/assets/images/barang.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Dina Minjam Baju'),
                                      Wrap(
                                        children: [
                                          Text(
                                            '20 Sep 2023',
                                            style: TextStyles.sMedium
                                                .copyWith(color: red),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Barang',
                                        style: TextStyles.sMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
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
