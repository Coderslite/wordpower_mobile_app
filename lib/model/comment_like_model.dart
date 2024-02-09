import 'package:cloud_firestore/cloud_firestore.dart';

class CommentLikeModel {
  String? id;
  String? authorId;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  CommentLikeModel({
   required this.id,
   required this.authorId,
    required this.createdAt,
   required this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorId': authorId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
