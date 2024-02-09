import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wordpower_app/screens/home/home_screen.dart';
import 'package:wordpower_app/screens/youtube/youtube_collection.dart';

import '../../../constants/app_bar.dart';
import '../../../constants/colors.dart';
import '../bible_screen/bible_books.dart';
import '../settings/settings.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({Key? key}) : super(key: key);

  @override
  _HomeRootState createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  int pageIndex = 0;

  runYoutubePlayer() {
    //
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(
        pageIndex,
        context,
      ),
      bottomNavigationBar: getFooter(size),
      body: getBody(),
    );
  }

  getBody() {
    List<Widget> pages = const [
      HomeScreen(),
      YoutubeCollection(),
      BibleBookScreen(),
      Settings(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  getFooter(size) {
    List bottomItems = [
      pageIndex == 0 ? Icons.home : Icons.home_outlined,
      pageIndex == 1 ? Icons.movie : Icons.movie_outlined,
      pageIndex == 2 ? Icons.library_books : Icons.library_books_outlined,
      pageIndex == 3 ? Icons.person : Icons.person_outline,
    ];

    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: appBarColor,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 20, bottom: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomItems.length,
            (index) {
              return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: SizedBox(
                  width: size.width / 6,
                  height: 30,
                  child: Icon(
                    bottomItems[index],
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
