import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wordpower_app/widgets/button.dart';

import '../../constants/colors.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          PinCodeTextField(
            
            length: 5,
            obscureText: false,
            animationType: AnimationType.fade,
            animationDuration: const Duration(milliseconds: 300),
            errorAnimationController: errorController, // Pass it here
            onChanged: (value) {
              setState(() {});
            },
            appContext: context,
          ),
          Button(text: "Verify", function: () {},isActive: true,)
        ]),
      ),
    );
  }
}
