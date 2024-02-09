import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/controller/register_controller.dart';
import 'package:wordpower_app/screens/auth_screens/personal_info_register.dart';
import 'package:wordpower_app/widgets/button.dart';

import '../../constants/colors.dart';

class PasswordScreen extends StatefulWidget {
  final String email;
  const PasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  RegisterController registerController = Get.put(RegisterController());
  final _formKey = GlobalKey<FormBuilderState>();

  var passwordController1 = TextEditingController();
  var passwordController2 = TextEditingController();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  bool isObsure1 = true;
  bool isObsure2 = true;
  bool isMatch = false;

  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (_password.isEmpty) {
      setState(() {
        password_strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        password_strength = 1 / 4;
      });
    } else if (_password.length < 10) {
      setState(() {
        password_strength = 2 / 4;
      });
    } else {
      if (pass_valid.hasMatch(_password)) {
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Create Password",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text("Create password"),
                      ],
                    ),
                    FormBuilderTextField(
                      name: 'password1',
                      obscureText: isObsure1,
                      controller: passwordController1,
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        } else {
                          //call function to check password
                          bool result = validatePassword(value);
                          if (result) {
                            // create account event
                            return null;
                          } else {
                            return " Password should contain Capital, small letter & Number & Special";
                          }
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObsure1 = !isObsure1;
                              });
                            },
                            child: Icon(isObsure2
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.4)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.4)),
                        ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 15,
                          fontFamily: "RedHatDisplay",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LinearProgressIndicator(
                        value: password_strength,
                        backgroundColor: Colors.grey[300],
                        minHeight: 5,
                        color: password_strength <= 1 / 4
                            ? Colors.red
                            : password_strength == 2 / 4
                                ? Colors.yellow
                                : password_strength == 3 / 4
                                    ? Colors.blue
                                    : Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text("Confirm password"),
                      ],
                    ),
                    FormBuilderTextField(
                      name: 'password2',
                      obscureText: isObsure2,
                      controller: passwordController2,
                      validator: (value) {
                        if (passwordController1.text != value) {
                          setState(() {
                            isMatch = false;
                          });
                          return "Password do not match";
                        } else if (password_strength != 1) {
                          setState(() {
                            isMatch = false;
                          });
                          return " Password should contain Capital, small letter & Number & Special";
                        } else {
                          setState(() {
                            isMatch = true;
                          });
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                        registerController.confirmPassword.value =
                            value.toString();
                      },
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObsure2 = !isObsure2;
                              });
                            },
                            child: Icon(isObsure2
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.4)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.4)),
                        ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 15,
                          fontFamily: "RedHatDisplay",
                        ),
                      ),
                    ),
                    Button(
                        isActive: isMatch,
                        text: "Create Password",
                        function: () {
                          isMatch
                              ? Get.to(PersonalInfoRegisterScreen(
                                  email: widget.email,
                                  password: passwordController1.text,
                                ))
                              : () {};
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
