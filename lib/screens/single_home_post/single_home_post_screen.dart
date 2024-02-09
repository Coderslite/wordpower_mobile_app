import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wordpower_app/screens/comment_screen/comment_screen.dart';
import 'package:line_icons/line_icons.dart';

import '../../../constants/colors.dart';

class SingleHomePostScreen extends StatefulWidget {
  final String description;
  final String id;
  const SingleHomePostScreen(
      {Key? key, required this.description, required this.id})
      : super(key: key);

  @override
  State<SingleHomePostScreen> createState() => _SingleHomePostScreenState();
}

class _SingleHomePostScreenState extends State<SingleHomePostScreen> {
  final _controller = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;
  Timer? _timer;
  bool end = false;

  @override
  void initState() {
    super.initState();
    // handleGetLikedProperties();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage == 1) {
        end = true;
      } else if (_currentPage == 0) {
        end = false;
      }

      if (end == false) {
        _currentPage++;
      } else {
        _currentPage--;
      }

      // _controller.animateToPage(
      //   _currentPage,
      //   duration: const Duration(milliseconds: 1000),
      //   curve: Curves.easeInOutCubic,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            "images/image1.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Wordpower Ministry",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Admin",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      LineIcons.verticalEllipsis,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                allowImplicitScrolling: true,
                itemBuilder: ((context, index) {
                  return PhotoView(
                      imageProvider: AssetImage("images/image1.jpg"));
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Row(
                    children: const [
                      Icon(Icons.favorite_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(CupertinoIcons.chat_bubble),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.share)
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 7,
                  effect: const ExpandingDotsEffect(
                    spacing: 13,
                    expansionFactor: (19 / 8),
                    radius: 20,
                    activeDotColor: Colors.white,
                    dotColor: Color(0xFFDADADA),
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    child: Icon(Icons.bookmark_outline)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "14 likes",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Text.rich(
                    TextSpan(
                        text: "Wordpower ",
                        style: TextStyle(fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                              text: widget.description,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ))
                        ]),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(CommentList(
                  postId: widget.id,
                ));
              },
              child: Row(
                children: [
                  Text(
                    "View all 34 comments",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "3 days ago",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
