import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordpower_app/screens/auth_screens/password_screen.dart';

import '../screens/home/home_root.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var gender = ''.obs;
  var name = ''.obs;
  var dob = ''.obs;
  late int docSize;

  handleCheckEmail() async {
    isLoading.value = true;
    final list = await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(email.string)
        .catchError((err) {
      Fluttertoast.showToast(msg: err.toString());
      isLoading.value = false;
    });
    if (list.isNotEmpty) {
      isLoading.value = false;
      // print("user already exist");
      Fluttertoast.showToast(msg: "User Already Exist");
    } else {
      isLoading.value = false;
      Get.to(PasswordScreen(
        email: email.string,
      ));
    }
  }

  handleRegister(String email, String password) async {
    isLoading.value = true;

    FirebaseFirestore.instance
        .collection("users")
        .where('email', isEqualTo: email.toLowerCase())
        .get()
        .then((value) {
      docSize = value.docs.length;
      if (docSize < 1) {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          var userCredentials = {
            "email": email,
            "password": password,
            "gender": gender.string,
            "name": name.string,
            "id": value.user!.uid.toString(),
          };
          var prefs = await SharedPreferences.getInstance();
          prefs.setString('userId', value.user!.uid);
          FirebaseFirestore.instance
              .collection("users")
              .doc(value.user!.uid)
              .set(userCredentials)
              .then((value) {
            isLoading.value = false;
            Fluttertoast.showToast(msg: "Registration Successful")
                .then((value) => Get.off(const HomeRoot()));
            // Get.to(VerifyEmailScreen())
          }).catchError((err) {
            isLoading.value = false;
            print(err);
          });
        }).catchError((err) {
          isLoading.value = false;
          Fluttertoast.showToast(msg: err.toString());
          print(err.toString());
        });
      } else {
        isLoading.value = false;
        Fluttertoast.showToast(msg: "Email already exist in database");
      }
    });
  }
}
