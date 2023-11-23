import 'package:flutter/material.dart';
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
            Container(
              padding: const EdgeInsets.all(30),
              color: white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi, Felicia',
                              style: TextStyles.xlSemiBold,
                            ),
                            Text(
                              'Welcome!',
                              style: TextStyles.sReguler.copyWith(color: grey2),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage(
                                'lib/assets/images/login_auth_screen.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 42,
                    child: TextFormField(
                      style: TextStyles.mReguler,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: (42 - 14) / 2),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: background,
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 5,
                        child: Text(
                          'Peminjaman Terkahir',
                          style: TextStyles.lSemiBold,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {},
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
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}