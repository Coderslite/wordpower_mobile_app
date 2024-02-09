import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../screens/home/home_root.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  handleLoginUser() {
    isLoading.value = true;
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email.toString(), password: password.toString())
        .then((value) {
      isLoading.value = false;
      Get.off(const HomeRoot());
    }).catchError((err) {
      isLoading.value = false;
      Fluttertoast.showToast(msg: err.toString());
      print(err.toString());
    });
  }
}
