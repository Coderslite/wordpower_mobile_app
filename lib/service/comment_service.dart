import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wordpower_app/model/post_model.dart';

import '../model/comment_like_model.dart';
import '../model/comment_model.dart';

class CommentService {
  static Stream<List<CommentModel>> fetchPostComment(String postId) =>
      FirebaseFirestore.instance
          .collection("comments")
          .where('postId', isEqualTo: postId)
          .snapshots()
          .map((event) =>
              event.docs.map((e) => CommentModel.fromJson(e.data())).toList());

  static Stream<CommentModel> getSingleComment(String commentId) =>
      FirebaseFirestore.instance
          .collection("comments")
          .doc(commentId)
          .snapshots()
          .map((event) => CommentModel.fromJson(event.data()!));

  static sendComment(CommentModel comment) {
    var docRef = FirebaseFirestore.instance.collection("comments").doc();
    var commentMap = comment.toJson();
    commentMap.update('id', (value) => value = docRef.id);
    docRef.set(commentMap);
  }

  static likeComment(CommentLikeModel like, String id) async {
    var docs = FirebaseFirestore.instance.collection('commentLikes');
    await docs.get().then((value) {
      print(value);
      for (var comment in value.docs) {
        // if(comment.data()['id']==id&&com)
        print(comment.data());
      }
    });
    // var commentLike = like.toJson();
    // docs.set(commentLike);

    //     var checkLikes = snapshotCommentLikes
    //     .where((element) => element['authorId'] == commentLike.authorId)
    //     .toList();
    // print("checkLikes");
    // print(checkLikes);
    // if (checkLikes.isEmpty) {
    //   docs.set({
    //     'commentLikes': FieldValue.arrayUnion([like]),
    //   }, SetOptions(merge: true));
    // } else {
    //   docs.update({
    //     "commentLikes": FieldValue.arrayRemove([like])
    //   });
    // }
  }
}
