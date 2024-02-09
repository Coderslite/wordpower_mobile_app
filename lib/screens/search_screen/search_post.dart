import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wordpower_app/model/post_model.dart';
import 'package:wordpower_app/service/get_post_service.dart';

import '../../model/comment_model.dart';

class SearchPostScreen extends StatefulWidget {
  const SearchPostScreen({super.key});

  @override
  State<SearchPostScreen> createState() => _SearchPostScreenState();
}

class _SearchPostScreenState extends State<SearchPostScreen> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.search,
                    ),
                  )),
            ),
            Expanded(
              child: StreamBuilder<List<PostModel>>(
                  stream: PostService.searchPost(searchValue),
                  builder: (context, snapshot1) {
                    return StreamBuilder<List<CommentModel>>(
                        stream: PostService.searchComent(searchValue),
                        builder: (context, snapshot2) {
                          if (snapshot1.hasError) {
                            return Text("Something went wrong");
                          } else if (snapshot1.hasData && snapshot2.hasData) {
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: snapshot1.data?.length,
                                      itemBuilder: (context, index) {
                                        var post = snapshot1.data![index];
                                        return ListTile(
                                          title: Text(post.title.toString()),
                                        );
                                      }),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: snapshot2.data?.length,
                                      itemBuilder: (context, index) {
                                        var comment = snapshot2.data![index];
                                        return ListTile(
                                          title:
                                              Text(comment.comment.toString()),
                                        );
                                      }),
                                )
                              ],
                            );
                          } else {
                            if (snapshot2.hasError) {
                              return Text("Something went wrong");
                            } else if (snapshot2.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot2.data?.length,
                                  itemBuilder: (context, index) {
                                    var comment = snapshot2.data![index];
                                    return ListTile(
                                      title: Text(comment.comment.toString()),
                                    );
                                  });
                            }
                            return Center(child: CircularProgressIndicator());
                          }
                        });
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
