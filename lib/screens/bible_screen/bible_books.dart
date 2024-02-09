import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/controller/get_bible_chapter_controller.dart';
import 'package:wordpower_app/screens/bible_screen/bible_chapters.dart';

class BibleBookScreen extends StatefulWidget {
  const BibleBookScreen({Key? key}) : super(key: key);

  @override
  State<BibleBookScreen> createState() => _BibleBookScreenState();
}

class _BibleBookScreenState extends State<BibleBookScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  List oldTestamentBooks = [
    "Genesis",
    "Exodus",
    "Leviticus",
    "Numbers",
    "Deuteronomy",
    "Joshua",
    "Judges",
    "Ruth",
    "1Samuel",
    "2Samuel",
    "1Kings",
    "2Kings",
    "1Chronicles",
    "2Chronicles",
    "Ezra",
    "Nehemiah",
    "Esther",
    "Job",
    "Psalms",
    "Proverbs",
    "Ecclesiastes",
    "SongofSolomon",
    "Isaiah",
    "Jeremiah",
    "Lamentations",
    "Ezekiel",
    "Daniel",
    "Hosea",
    "Joel",
    "Amos",
    "Obadiah",
    "Jonah",
    "Micah",
    "Nahum",
    "Habakkuk",
    "Zephaniah",
    "Haggai",
    "Zechariah",
    "Malachi",
  ];

  List newTestamentBooks = [
    "Matthew",
    "Mark",
    "Luke",
    "John",
    "Acts",
    "Romans",
    "1Corinthians",
    "2Corinthians",
    "Galatians",
    "Ephesians",
    "Philippians",
    "Colossians",
    "1Thessalonians",
    "2Thessalonians",
    "1Timothy",
    "2Timothy",
    "Titus",
    "Philemon",
    "Hebrews",
    "James",
    "1Peter",
    "2Peter",
    "1John",
    "2John",
    "3John",
    "Jude",
    "Revelation",
  ];

  GetBibleChaptersController getBibleChaptersController =
      Get.put(GetBibleChaptersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          TabBar(controller: _tabController, tabs: [
            Text("OLD"),
            Text("NEW"),
          ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                    itemCount: oldTestamentBooks.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          getBibleChaptersController.bookName.value =
                              oldTestamentBooks[index];
                          Get.to(BibleChapters(
                              bookName: oldTestamentBooks[index]));
                        },
                        child: InkWell(
                          child: ListTile(
                            title: Text(oldTestamentBooks[index]),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: newTestamentBooks.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          getBibleChaptersController.bookName.value =
                              newTestamentBooks[index];
                          Get.to(BibleChapters(
                              bookName: newTestamentBooks[index]));
                        },
                        child: ListTile(
                          title: Text(newTestamentBooks[index]),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
