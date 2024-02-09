import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wordpower_app/model/bible_model.dart';

Future<List<BibleModel>> getBookChapters(String bookName) async {
  var response = await rootBundle.loadString("bible/$bookName.json");
  var responseData = jsonDecode(response);
  List chapters = responseData['chapters'];
  print(chapters);
  return chapters.map((e) => BibleModel.fromJson(e)).toList();
}
