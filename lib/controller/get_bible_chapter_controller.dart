import 'package:get/get.dart';

import '../model/bible_model.dart';
import '../service/get_bible_chapters.dart';

class GetBibleChaptersController extends GetxController {
  late Future<List<BibleModel>> bible;
  var isLoading = true.obs;
  var bookName = 'Genesis'.obs;
  var bibleList = [].obs;
  var chapter = '1'.obs;
  var bibleVerse = [].obs;
  var newBibleVerse = [].obs;

  handleGetBibleChapters() async {
    isLoading.value = true;
    print(bookName);
    bible = getBookChapters(bookName.string);
    bible.then((value) {
      isLoading.value = false;
      bibleList.value = value;
    });
  }

  handleGetBibleVerses() {
    int myChapter = int.parse(chapter.toString());
    bibleVerse.value =
        bibleList.where((p0) => p0.chapter == myChapter.toString()).toList();
    newBibleVerse.value = bibleVerse[0].verses;
  }

  @override
  void onInit() {
    handleGetBibleChapters();
    super.onInit();
  }
}
