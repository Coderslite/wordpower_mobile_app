import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class UserService {
  static Future<UserModel?> getUserInfo(String userId) async {
    var docRef = FirebaseFirestore.instance.collection("users").doc(userId);
    var snapshot = await docRef.get();
    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    } else {
      print(snapshot.data());
    }
    return null;
  }
}
