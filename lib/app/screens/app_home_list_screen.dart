import 'package:flutter/material.dart';
import 'package:lend_lab/app/widgets/button.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container(
                color: background,
                padding: const EdgeInsets.all(30),
                child: Column(
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
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
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
                                                      'lib/assets/images/login_auth_screen.png'),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Menunggu Pengembalian',
                                            style: TextStyles.sMedium
                                                .copyWith(color: grey3),
                                          ),
                                        ),
                                        ButtonSelesai(
                                          text: 'Selesaikan',
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Divider(
                                height: 1,
                                color: grey1,
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
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
                                                      'lib/assets/images/login_auth_screen.png'),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Menunggu Pengembalian',
                                            style: TextStyles.sMedium
                                                .copyWith(color: grey3),
                                          ),
                                        ),
                                        ButtonSelesai(
                                          text: 'Selesaikan',
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
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
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
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
                                                      'lib/assets/images/login_auth_screen.png'),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Menunggu Pengembalian',
                                            style: TextStyles.sMedium
                                                .copyWith(color: grey3),
                                          ),
                                        ),
                                        ButtonSelesai(
                                          text: 'Selesaikan',
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Divider(
                                height: 1,
                                color: grey1,
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
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
                                                      'lib/assets/images/login_auth_screen.png'),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Menunggu Pengembalian',
                                            style: TextStyles.sMedium
                                                .copyWith(color: grey3),
                                          ),
                                        ),
                                        ButtonSelesai(
                                          text: 'Selesaikan',
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Divider(
                                height: 1,
                                color: grey1,
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
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
                                                      'lib/assets/images/login_auth_screen.png'),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Menunggu Pengembalian',
                                            style: TextStyles.sMedium
                                                .copyWith(color: grey3),
                                          ),
                                        ),
                                        ButtonSelesai(
                                          text: 'Selesaikan',
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
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
    );
  }
}
