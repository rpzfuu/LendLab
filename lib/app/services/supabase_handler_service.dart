// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseHandler {
  static String SupabaseURL = "https://enehpaaaycwnqfcugiqe.supabase.co";
  static String SupabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVuZWhwYWFheWN3bnFmY3VnaXFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE0OTkyNjYsImV4cCI6MjAxNzA3NTI2Nn0.1DrLVsffVCpaBVXVJWixHZDmCSXeRCaqcFAODUnDCco";

  final client = SupabaseClient(SupabaseURL, SupabaseKey);

  String GetURL() {
    return SupabaseURL;
  }

  String GetKey() {
    return SupabaseKey;
  }

  //signup
  addUser(String first_name, String last_name, String email,
      String password) async {
    var response = await client.from('User').insert({
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password
    });
  }
  //login

  Future<bool> cekLogin(String email, String password) async {
    var response = await client
        .from('User')
        .select()
        .eq('email', email)
        .eq('password', password)
        // ignore: deprecated_member_use
        .execute();
    if (response.data != null && response.data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>?> getID(String email, String password) async {
    bool isLogin = await cekLogin(email, password);
    if (isLogin) {
      var response = await client
          .from('User')
          .select('id_user')
          .eq('email', email)
          .eq('password', password)
          .single();
      return response;
    }
    return null;
  }

  // Future<bool> cekLogin(String email, String password) async {
  //   var response = await client
  //       .from('User')
  //       .select('email,password')
  //       .eq('email', email)
  //       .eq('password', password)
  //       .single();
  //   final isUser = response.data as List;
  //   if (isUser.length == 1) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
//mengambil data user
  Future<Map<String, dynamic>> dataUser(int id) async {
    var response =
        await client.from('User').select().eq('id_user', id).single();
    return response;
  }
}
