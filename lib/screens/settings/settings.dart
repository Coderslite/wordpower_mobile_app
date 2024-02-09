import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/screens/auth_screens/login_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Get.off(LoginScreen()));
            },
            child: ListTile(
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              subtitle: Text("logout of this account"),
            ),
          )
        ],
      ),
    );
  }
}
