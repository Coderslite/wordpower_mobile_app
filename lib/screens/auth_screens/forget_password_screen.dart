import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: 'ab@great.com', password: "Mesomorph");
                FirebaseFirestore.instance
                    .collection("users")
                    .add({
                      "email": "ab@gmail.com",
                      "password": "Mesomorph",
                    })
                    .then((value) => print("done"))
                    .catchError((err) => print(err));
              },
              child: Text("Add Info")),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("users")
                    .get()
                    .then((value) => print(value.docs.length));
              },
              child: Text("Fetch"))
        ],
      ),
    );
  }
}
