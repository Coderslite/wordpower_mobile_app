import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String? id;
  String? postId;
  String? authourId;
  String? comment;
  List? commentLikes;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  CommentModel(
      {required this.id,
      required this.postId,
      required this.authourId,
      required this.comment,
      required this.commentLikes,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toJson() => {
        'id': id,
        'postId': postId,
        'authorId': authourId,
        'comment': comment,
        'commentLikes': commentLikes,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      postId: json['postId'],
      authourId: json['authorId'],
      comment: json['comment'],
      commentLikes: json['commentLikes'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

}
