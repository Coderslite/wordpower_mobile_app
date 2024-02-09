import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:get/get.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/controller/change_bible_text.dart';
import 'package:wordpower_app/controller/get_bible_chapter_controller.dart';

class BibleVerseScreen extends StatefulWidget {
  const BibleVerseScreen({Key? key}) : super(key: key);

  @override
  State<BibleVerseScreen> createState() => _BibleVerseScreenState();
}

class _BibleVerseScreenState extends State<BibleVerseScreen> {
  GetBibleChaptersController getBibleChaptersController =
      Get.put(GetBibleChaptersController());

  ChangeBibleTextStyleController changeBibleTextStyleController =
      Get.put(ChangeBibleTextStyleController());

  final FlutterTts flutterTts = FlutterTts();

  Future _speak() async {
    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(0.3);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(0.7);
    await flutterTts.setVoice({"name": "John", "locale": "en-US"});
    await flutterTts.speak(
        "${getBibleChaptersController.bookName.string} ${getBibleChaptersController.chapter.string} KJV");
    await flutterTts.awaitSpeakCompletion(true);

    for (var element in getBibleChaptersController.newBibleVerse) {
      await flutterTts.speak(element['text']);
    }
  }

  @override
  void initState() {
    getBibleChaptersController.handleGetBibleVerses();
    // changeBibleTextStyleController.handleGetColorIndex();
    print(changeBibleTextStyleController.currentColor);
    super.initState();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Obx(
            () => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${getBibleChaptersController.bookName.string} ${getBibleChaptersController.chapter.string} KJV",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              changeBibleTextStyleController
                                  .handleChangeColor();
                            },
                            child: const Icon(Icons.color_lens)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () => _speak(),
                            child: const Icon(CupertinoIcons.speaker)),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount:
                          getBibleChaptersController.newBibleVerse.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getBibleChaptersController
                                  .newBibleVerse[index]['verse']),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.15,
                                  child: Obx(
                                    () => Text(
                                      getBibleChaptersController
                                          .newBibleVerse[index]['text'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: changeBibleTextStyleController
                                            .color[int.parse(
                                          changeBibleTextStyleController
                                              .currentColor
                                              .toString(),
                                        )],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
