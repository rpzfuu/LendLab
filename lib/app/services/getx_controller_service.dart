import 'package:get/get.dart';

class UserController extends GetxController {
  var userId = 0.obs;

  void updateUser(int id) {
    userId.value = id;
  }
}
