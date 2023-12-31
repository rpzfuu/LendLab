import 'package:flutter/material.dart';
import 'package:lend_lab/app/services/supabase_handler_service.dart';
import 'package:lend_lab/app/widgets/button_widget.dart';
import 'package:lend_lab/theme/app_colors.dart';
import 'package:lend_lab/theme/app_text_styles.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _loginfield = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool terisi = false;
  void isTerisi() {
    bool temp = _firstnameController.text.isNotEmpty &&
        _lastnameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;

    setState(() {
      terisi = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstnameController.addListener(isTerisi);
    _lastnameController.addListener(isTerisi);
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
                      'Buat Akun Baru',
                      style: TextStyles.xlSemiBold,
                    ),
                    Text(
                      'Buat Akunmu Untuk Memulai Pencatatan',
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
                        AssetImage('lib/assets/images/signup_auth_screen.png'),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _loginfield,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama Lengkap',
                        style: TextStyles.sSemiBold,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: _firstnameController,
                                style: TextStyles.sReguler,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  hintText: 'Nama Depan',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 10,
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: _lastnameController,
                                style: TextStyles.sReguler,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  hintText: 'Nama Belakang',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Email',
                        style: TextStyles.sSemiBold,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: _emailController,
                          style: TextStyles.sReguler,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            hintText: 'Masukkan Email-mu',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan";
                            }
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!emailValid) {
                              return "Masukkan Email Yang Valid";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Kata Sandi',
                        style: TextStyles.sSemiBold,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyles.sReguler,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            hintText: 'Masukkan Kata Sandi',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Kata Sandi";
                            }
                            if (value.length < 6) {
                              return "Kata Sandi harus lebih dari 6 karakter";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      ButtonPrimary(
                        isEnable: terisi,
                        text: 'Buat Akun',
                        onPressed: () async {
                          if (_loginfield.currentState!.validate()) {
                            final handler = SupaBaseHandler();
                            try {
                              await handler.addUser(
                                _firstnameController.text.trim(),
                                _lastnameController.text.trim(),
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              );
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Berhasil Membuat Akun, Silahkan Langsung Login'),
                                    backgroundColor: Colors.green,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/login', (route) => false);
                              }
                            } catch (e) {
                              if (e is PostgrestException &&
                                  e.code == '23505') {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Email sudah digunakan, silakan gunakan email lain.'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              }
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sudah Punya Akun?',
                            style: TextStyles.sMedium.copyWith(color: grey2),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                'Masuk',
                                style: TextStyles.sMedium
                                    .copyWith(color: mainColor),
                              ))
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
