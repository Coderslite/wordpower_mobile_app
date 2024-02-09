import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wordpower_app/model/post_model.dart';
import 'package:wordpower_app/service/get_post_service.dart';

class IndividualPost extends StatefulWidget {
  final String id;
  const IndividualPost({super.key, required this.id});

  @override
  State<IndividualPost> createState() => _IndividualPostState();
}

class _IndividualPostState extends State<IndividualPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PostModel?>(
          future: PostService.getSinglePost(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            } else if (snapshot.hasData) {
              var post = snapshot.data;
              return Column(
                children: [
                  ListTile(
                    title: Text(post!.title.toString()),
                    subtitle: Text(post.description.toString()),
                  )
                ],
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
