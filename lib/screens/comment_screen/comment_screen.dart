import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/model/comment_model.dart';
import 'package:wordpower_app/model/user_model.dart';

import '../../model/comment_like_model.dart';
import '../../service/comment_service.dart';
import '../../service/user_service.dart';

class CommentList extends StatefulWidget {
  final String postId;
  const CommentList({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  User? user = FirebaseAuth.instance.currentUser;
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<CommentModel>>(
                  stream: CommentService.fetchPostComment(widget.postId),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(''),
                      );
                    }
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var comment = snapshot.data![index];
                            return EachComment(
                              description: comment.comment.toString(),
                              userId: comment.authourId.toString(),
                              commentId: comment.id.toString(),
                            );
                          });
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
            Row(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextFormField(
                      controller: commentController,
                      decoration: InputDecoration(
                          hintText: "Write your comment here",
                          filled: true,
                          fillColor: const Color.fromARGB(255, 19, 1, 1),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    )),
                InkWell(
                    onTap: () {
                      var comment = CommentModel(
                          id: '',
                          postId: widget.postId,
                          authourId: user!.uid,
                          comment: commentController.text,
                          commentLikes: [],
                          createdAt: Timestamp.now(),
                          updatedAt: Timestamp.now());
                      CommentService.sendComment(comment);
                      commentController.clear();
                    },
                    child: Icon(Icons.send))
              ],
            )
          ],
        ));
  }
}

class EachComment extends StatefulWidget {
  final String description;
  final String userId;
  final String commentId;
  const EachComment(
      {Key? key,
      required this.description,
      required this.userId,
      required this.commentId})
      : super(key: key);

  @override
  State<EachComment> createState() => _EachCommentState();
}

class _EachCommentState extends State<EachComment> {
  bool isLove = false;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
        future: UserService.getUserInfo(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.hasData) {
            return ListTile(
              leading: ClipOval(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    "https://th.bing.com/th/id/OIP.aVtg8witXWnxcT0MTTB2tQHaHa?pid=ImgDet&rs=1",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(snapshot.data!.name.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.description.toString()),
                  const Text(
                    "1 like",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              trailing: InkWell(
                  onTap: () {
                    setState(() {
                      isLove = !isLove;
                      CommentLikeModel commentLike = CommentLikeModel(
                          id: '',
                          authorId: user!.uid,
                          createdAt: Timestamp.now(),
                          updatedAt: Timestamp.now());
                      CommentService.likeComment(commentLike, widget.commentId);
                    });
                  },
                  child: Icon(
                    isLove ? Icons.favorite : Icons.favorite_outline,
                    color: isLove ? Colors.red : Colors.grey,
                    size: 20,
                  )),
            );
          } else {
            return const Text("");
          }
        });
  }
}
