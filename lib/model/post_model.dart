class PostModel {
  String? id;
  String? title;
  String? description;
  PostModel({
    this.id,
    this.title,
    this.description,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
