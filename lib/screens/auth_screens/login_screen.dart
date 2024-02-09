import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/controller/login_controller.dart';
import 'package:wordpower_app/screens/auth_screens/email_screen.dart';
import 'package:wordpower_app/screens/auth_screens/forget_password_screen.dart';
import 'package:wordpower_app/widgets/button.dart';

import '../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = false;
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: Obx(
        () => SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("images/logo.png"),
                  ),
                  const Text(
                    "Welcome Back!!",
                    style: TextStyle(fontSize: 23),
                  ),
                  FormBuilder(
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'email',
                          onChanged: (value) {
                            loginController.email.value = value.toString();
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.white38,
                              fontFamily: "RedHatDisplay",
                            ),
                            prefixIcon: Icon(
                              Icons.email,
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
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        FormBuilderTextField(
                          name: 'password',
                          obscureText: obscure,
                          onChanged: (value) {
                            loginController.password.value = value.toString();
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.white38,
                              fontFamily: "RedHatDisplay",
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key_outlined,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  loginController.isLoading.isTrue
                      ? const CircularProgressIndicator()
                      : Button(
                          text: "Login",
                          function: () {
                            loginController.handleLoginUser();
                          },
                          isActive: true,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width - 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot your login information ?",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            fontFamily: "RedHatDisplay",
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return const ForgetPasswordScreen();
                            }));
                          },
                          child: const Text(
                            "Click here",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "RedHatDisplay",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    child: const Text(
                      "Create a new Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const EmailScreen();
                      }));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
