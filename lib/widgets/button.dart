import 'package:flutter/material.dart';
import 'package:wordpower_app/constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final dynamic function;
  final bool isActive;
  const Button(
      {Key? key,
      required this.text,
      required this.function,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      width: size.width * 0.99,
      child: ElevatedButton(
        onPressed: function,
        child: Text(text),
        style: ElevatedButton.styleFrom(primary: isActive ? buttonFollowColor : grey),
      ),
    );
  }
}
