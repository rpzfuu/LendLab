import 'package:flutter/material.dart';
import 'package:lend_lab/app/services/supabase_handler_service.dart';
import 'package:lend_lab/app/widgets/button_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool terisi = false;
  void isTerisi() {
    bool temp =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    setState(() {
      terisi = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(isTerisi);
    _passwordController.addListener(isTerisi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Datang,',
                      style: TextStyles.xlSemiBold,
                    ),
                    Text(
                      'Ayok masuk dan lanjutkan pencatatanmu',
                      style: TextStyles.sReguler.copyWith(color: grey2),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 45),
              const Center(
                child: SizedBox(
                  height: 280,
                  child: Image(
                    image:
                        AssetImage('lib/assets/images/login_auth_screen.png'),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyles.sSemiBold,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: _emailController,
                        style: TextStyles.sReguler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16),
                          hintText: 'Masukkan Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Kata Sandi',
                      style: TextStyles.sSemiBold,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyles.sReguler,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16),
                          hintText: 'Masukkan Kata sandi',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ButtonPrimary(
                      isEnable: terisi,
                      text: 'Masuk',
                      onPressed: () async {
                        final handler = SupaBaseHandler();
                        final idUser = await handler.getID(
                            _emailController.text.trim(),
                            _passwordController.text.trim());
                        if (mounted) {
                          // ignore: unnecessary_null_comparison
                          if (idUser != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Masuk Sukses!'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/app', (route) => false,
                                arguments: idUser['id_user']);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Masuk Gagal'),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tidak Punya Akun?',
                          style: TextStyles.sMedium.copyWith(color: grey2),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              'Mendaftar',
                              style:
                                  TextStyles.sMedium.copyWith(color: mainColor),
                            ))
                      ],
                    ),
                    const SizedBox(height: 50),
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
