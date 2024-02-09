import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/controller/get_bible_chapter_controller.dart';
import 'package:wordpower_app/screens/bible_screen/bibe_verse.dart';


class BibleChapters extends StatefulWidget {
  final String bookName;
  const BibleChapters({Key? key, required this.bookName}) : super(key: key);

  @override
  State<BibleChapters> createState() => _BibleChaptersState();
}

class _BibleChaptersState extends State<BibleChapters> {
  GetBibleChaptersController getBibleChaptersController =
      Get.put(GetBibleChaptersController());
  @override
  void initState() {
    getBibleChaptersController.handleGetBibleChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Obx(
        () => getBibleChaptersController.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: getBibleChaptersController.bibleList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      getBibleChaptersController.chapter.value =
                          getBibleChaptersController.bibleList[index].chapter
                              .toString();
                      Get.to(BibleVerseScreen());
                    },
                    child: ListTile(
                      title: Text(widget.bookName +
                          " " +
                          getBibleChaptersController.bibleList[index].chapter
                              .toString()),
                    ),
                  );
                }),
      ),
    );
  }
}
