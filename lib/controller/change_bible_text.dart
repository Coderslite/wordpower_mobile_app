import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeBibleTextStyleController extends GetxController {
  var currentColor = 0.obs;
  var color = [
    Colors.white,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.orange,
  ];

  handleGetColorIndex() async {
    var prefs = await SharedPreferences.getInstance();
    var colorIndex = prefs.getString('colorIndex');
    print("colorIndex$colorIndex");
    currentColor.value =
        colorIndex == null ? 0 : int.parse(colorIndex.toString());
  }

  handleChangeColor() async {
    if (currentColor >= 5) {
      currentColor.value = 0;
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('colorIndex', currentColor.string);
    } else {
      currentColor.value = currentColor.toInt() + 1;
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('colorIndex', currentColor.string);
    }
  }

  @override
  void onInit() {
    handleGetColorIndex();
    super.onInit();
  }
}
