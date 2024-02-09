import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/message_model.dart';

User? user = FirebaseAuth.instance.currentUser;
late Future<List<MessageModel>> messageModel;

class MessageController extends GetxController {
  var message = ''.obs;

  var messageList = [].obs;

  static Stream<List<MessageModel>> getChats() {
    return FirebaseFirestore.instance
        .collection("chats")
        .doc(user!.uid)
        .collection(user!.uid)
        .snapshots()
        .map((QuerySnapshot event) {
      List<MessageModel> messages = [];
      for (var message in event.docs) {
        // final messageModel =
        //     MessageModel.
        // messages.add(messageModel);
      }
      return messages;
    });
  }

  handleSendMessage() {
    Map<String, dynamic> messageModel = {
      "senderId": user!.uid,
      "receriverId": "admin",
      "message": message.string,
      "date": DateTime.now().toString(),
    };
    FirebaseFirestore.instance
        .collection("chats")
        .doc(user!.uid)
        .collection(user!.uid)
        .doc()
        .set(messageModel)
        .then((value) {});
  }

  @override
  void onInit() {
    super.onInit();
  }
}
