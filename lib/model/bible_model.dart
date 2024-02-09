class BibleModel {
  String? chapter;
  List? verses;

  BibleModel({
    this.chapter,
    this.verses,
  });

  factory BibleModel.fromJson(Map<String, dynamic> json) {
    return BibleModel(chapter: json['chapter'], verses: json['verses']);
  }
}
