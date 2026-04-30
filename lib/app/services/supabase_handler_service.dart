// ignore_for_file: non_constant_identifier_names, unused_local_variable, deprecated_member_use

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseHandler {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  SupabaseClient get client => Supabase.instance.client;

  String GetURL() {
    return supabaseUrl;
  }

  String GetKey() {
    return supabaseAnonKey;
  }

  //signup
  addUser(String first_name, String last_name, String email,
      String password) async {
    var response = await client.from('User').insert(
      {
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password
      },
    );
  }
  //login

  Future<bool> cekLogin(String email, String password) async {
    var response = await client
        .from('User')
        .select()
        .eq('email', email)
        .eq('password', password)
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

//mengambil data user
  Future<Map<String, dynamic>> dataUser(int id) async {
    var response =
        await client.from('User').select().eq('id_user', id).single();
    return response;
  }

//mengambil data pinjaman
  Future<List<Map<String, dynamic>>> dataPinjamanUser(int id) async {
    var response =
        await client.from('Pinjaman').select().eq('id_user', id).execute();

    return List<Map<String, dynamic>>.from(response.data);
  }

  //tambahkan pinjaman
  Future<void> addPinjaman(int idUser, String namaPeminjam, String nilai,
      String tanggalMeminjam, String kategori) async {
    try {
      await client.from('Pinjaman').insert(
        {
          'id_user': idUser,
          'nama_peminjam': namaPeminjam,
          'nilai': nilai,
          'tanggal_meminjam': tanggalMeminjam,
          'kategori': kategori,
        },
      );
    } catch (error) {
      throw Exception('Gagal menambahkan peminjaman: $error');
    }
  }

  //selesaikan pinjaman
  Future<void> selesaikanPinjaman(int idPinjaman) async {
    try {
      await client.from('Pinjaman').update({
        'selesai': true,
        'tanggal_pengembalian': DateTime.now().toIso8601String()
      }).eq('id_pinjaman', idPinjaman);
    } catch (error) {
      throw Exception('Gagal menyelesaikan peminjaman: $error');
    }
  }

  //delete pinjaman
  Future<void> deletePinjaman(int idPinjaman) async {
    try {
      await client.from('Pinjaman').delete().eq('id_pinjaman', idPinjaman);
    } catch (error) {
      throw Exception('Gagal menghapus peminjaman: $error');
    }
  }

  //update pinjaman
  Future<void> updatePinjaman(
    int idPinjaman,
    String namaPeminjam,
    String nilai,
    String tanggal_meminjam,
  ) async {
    try {
      await client.from('Pinjaman').update({
        'nama_peminjam': namaPeminjam,
        'nilai': nilai,
        'tanggal_meminjam': tanggal_meminjam
      }).eq('id_pinjaman', idPinjaman);
    } catch (error) {
      throw Exception('Gagal memperbarui peminjaman: $error');
    }
  }
}
