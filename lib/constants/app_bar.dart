import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/screens/search_screen/search_post.dart';

import '../screens/chats/chat_screen.dart';

getAppBar(int pageIndex, context) {
  if (pageIndex == 0) {
    return AppBar(
      backgroundColor: appBarColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: const Icon(
              CupertinoIcons.camera,
              size: 18,
            ),
          ),
          // SvgPicture.asset("images/slr.svg"),
          const Text(
            "Wordpower Ministry",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "RedHatDisplay",
            ),
          ),
          // Icon(
          //   Icons.message_outlined,
          //   size: 30,
          // ),
          GestureDetector(
            child: const Icon(
              CupertinoIcons.chat_bubble_2_fill,
              color: Colors.white,
              size: 20,
            ),
            onTap: () {
              Get.to(const ChatScreen());
            },
          ),

          GestureDetector(
            child: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
              size: 20,
            ),
            onTap: () {
              Get.to(const SearchPostScreen());
            },
          ),
        ],
      ),
    );
  }
  // else if (pageIndex == 1) {
  //   null;
  // }
  else if (pageIndex == 1) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        "Triumphant Tv",
        style: TextStyle(
          fontFamily: "RedHatDisplay",
        ),
      ),
      automaticallyImplyLeading: false,
    );
  } else if (pageIndex == 2) {
    return AppBar(
      backgroundColor: appBarColor,
      title: const Text(
        "Bible",
        style: TextStyle(
          fontFamily: "RedHatDisplay",
        ),
      ),
      automaticallyImplyLeading: false,
    );
  } else {
    return AppBar(
      backgroundColor: appBarColor,
      title: const Text(
        "Setting",
        style: TextStyle(
          fontFamily: "RedHatDisplay",
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
