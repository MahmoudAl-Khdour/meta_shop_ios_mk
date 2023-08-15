import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<int> index = Rx<int>(0);

  UserController();

  List<String> userList = [
    'Login',
    'Signup',
  ];
}
