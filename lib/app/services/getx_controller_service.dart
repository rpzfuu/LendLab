// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';

class UserController extends GetxController {
  var idUser = 0.obs;

  void updateUser(int id) {
    idUser.value = id;
  }
  //int idUser = Get.find<UserController>().idUser.value;
  //import 'package:lend_lab/app/services/getx_controller_service.dart';
  //import 'package:get/get.dart';
}

class PinjamanController extends GetxController {
  var listPinjaman = [].obs;
  void updateListPinjaman(List<Map<String, dynamic>> data) {
    listPinjaman.value = data;
  }
}
