import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wordpower_app/model/post_model.dart';

import '../model/comment_model.dart';

class PostService {
  static Stream<List<PostModel>> readPosts() =>
      FirebaseFirestore.instance.collection("posts").snapshots().map((event) =>
          event.docs.map((e) => PostModel.fromJson(e.data())).toList());

  static Stream<List<PostModel>> searchPost(String searchQuery) =>
      searchQuery.isNotEmpty
          ? FirebaseFirestore.instance
              .collection("posts")
              .where('title',
                  isGreaterThanOrEqualTo: searchQuery,
                  isLessThan: searchQuery.substring(0, searchQuery.length - 1) +
                      String.fromCharCode(
                          searchQuery.codeUnitAt(searchQuery.length - 1) + 1))
              .snapshots()
              .map((event) =>
                  event.docs.map((e) => PostModel.fromJson(e.data())).toList())
          : FirebaseFirestore.instance.collection("posts").snapshots().map(
              (event) =>
                  event.docs.map((e) => PostModel.fromJson(e.data())).toList());

  static Stream<List<CommentModel>> searchComent(String searchQuery) =>
      searchQuery.isNotEmpty
          ? FirebaseFirestore.instance
              .collection("comments")
              .where('comment',
                  isGreaterThanOrEqualTo: searchQuery,
                  isLessThan: searchQuery.substring(0, searchQuery.length - 1) +
                      String.fromCharCode(
                          searchQuery.codeUnitAt(searchQuery.length - 1) + 1))
              .snapshots()
              .map((event) => event.docs
                  .map((e) => CommentModel.fromJson(e.data()))
                  .toList())
          : FirebaseFirestore.instance.collection("comment").snapshots().map(
              (event) => event.docs
                  .map((e) => CommentModel.fromJson(e.data()))
                  .toList());

  static Future<PostModel?> getSinglePost(String id) async {
    final docRef = FirebaseFirestore.instance.collection("posts").doc(id);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      return PostModel.fromJson(snapshot.data()!);
    } else {
      print("not exit");
    }
  }
}
