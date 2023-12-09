// ignore_for_file: prefer_typing_uninitialized_variables, prefer_collection_literals

import 'package:get/get.dart';

class UserController extends GetxController {
  var idUser = 0.obs;

  void updateUserID(int id) {
    idUser.value = id;
  }

  var user = Map<String, dynamic>().obs;

  void updateUser(Map<String, dynamic> newUser) {
    user.value = newUser;
  }
}
//int idUser = Get.find<UserController>().idUser.value;
//Get.find<UserController>().updateUserID(idUser['id_user']);
//Map<String, dynamic> dataUser = Get.find<UserController>().user.value;
//Get.find<UserController>().updateUser();
//import 'package:lend_lab/app/services/getx_controller_service.dart';
//import 'package:get/get.dart';

class DataPinjamanController extends GetxController {
  var dataPinjaman = <Map<String, dynamic>>[].obs;
  void updatedataPinjaman(List<Map<String, dynamic>> newData) {
    dataPinjaman.value = newData;
  }
}
