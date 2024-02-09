import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/controller/register_controller.dart';
import 'package:wordpower_app/widgets/button.dart';

import '../../constants/colors.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create Email Address",
                  style: TextStyle(fontSize: 23),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text("Email Address"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilder(
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        onChanged: (value) {
                          registerController.email.value = value.toString();
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white.withOpacity(0.4),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 15,
                            fontFamily: "RedHatDisplay",
                          ),
                        ),
                      ),
                      registerController.isLoading.isTrue
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            )
                          : Button(
                              text: "Create Email",
                              function: () {
                                registerController.handleCheckEmail();
                              },
                              isActive: true,
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
