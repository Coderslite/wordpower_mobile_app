import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/controller/send_message_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  List mesages = [1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0];
  MessageController messageController = Get.put(MessageController());
  var _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Obx(
        () => SafeArea(
          child: Column(
            children: [
              const Text("Chat Apostle M.E Freedman"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("online"),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: messageController.messageList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return messageController.messageList[index]['senderId'] ==
                            user!.uid.toString()
                        ? SenderMessage(
                            message: messageController.messageList[index]
                                ['message'],
                          )
                        : ReceiverMessage(
                            message: messageController.messageList[index]
                                ['message'],
                          );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _messageController,
                        onChanged: (value) {
                          messageController.message.value = value.toString();
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      _messageController.clear();
                      messageController.handleSendMessage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SenderMessage extends StatelessWidget {
  final String message;
  const SenderMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 0, top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "ansjakdjskldlsfjlsfjklkdjkl",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "yesterday",
                  style: TextStyle(fontSize: 12, color: grey),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.check,
                  size: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ReceiverMessage extends StatelessWidget {
  final String message;
  const ReceiverMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 50, top: 5, bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.check,
                  size: 10,
                  color: black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "yesterday",
                  style: TextStyle(fontSize: 12, color: grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
