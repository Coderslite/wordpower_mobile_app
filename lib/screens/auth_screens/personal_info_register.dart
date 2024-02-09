import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/controller/register_controller.dart';
import 'package:wordpower_app/screens/auth_screens/verify_email_otp.dart';
import 'package:wordpower_app/widgets/button.dart';

import '../../constants/colors.dart';

class PersonalInfoRegisterScreen extends StatefulWidget {
  final String email;
  final String password;
  const PersonalInfoRegisterScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<PersonalInfoRegisterScreen> createState() =>
      _PersonalInfoRegisterScreenState();
}

class _PersonalInfoRegisterScreenState
    extends State<PersonalInfoRegisterScreen> {
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Personal Information",
                style: TextStyle(fontSize: 23),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text("Enter Name"),
                ],
              ),
              FormBuilder(
                  child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'fullName',
                    onChanged: (value) {
                      registerController.name.value = value.toString();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
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
                      hintText: "Enter Full Name",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text("Gender"),
                    ],
                  ),
                  FormBuilderDropdown(
                    name: 'gender',
                    isExpanded: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (value) {
                      registerController.gender.value = value.toString();
                    },
                    items: [
                      "Male",
                      "Female",
                    ].map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.male,
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
                      hintText: "Gender",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text("Date of Birth"),
                    ],
                  ),
                  FormBuilderDateTimePicker(
                    name: 'dob',
                    // initialDatePickerMode: DatePickerMode.year,
                    inputType: InputType.date,
                    onChanged: (value) {
                      registerController.dob.value = value.toString();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.cake,
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
                      hintText: "Date of Birth",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: "RedHatDisplay",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  registerController.isLoading.isTrue
                      ? CircularProgressIndicator()
                      : Button(
                          text: "Complete Registration",
                          function: () {
                            registerController.handleRegister(
                                widget.email, widget.password);
                          },
                          isActive: true,
                        ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
