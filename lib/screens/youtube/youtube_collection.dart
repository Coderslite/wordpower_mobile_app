import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpower_app/constants/colors.dart';
import 'package:wordpower_app/controller/youtube_video_controller.dart';
import 'package:wordpower_app/screens/youtube/youtube_single.dart';

class YoutubeCollection extends StatefulWidget {
  const YoutubeCollection({Key? key}) : super(key: key);

  @override
  State<YoutubeCollection> createState() => _YoutubeCollectionState();
}

class _YoutubeCollectionState extends State<YoutubeCollection> {
  YoutubeVideoController youtubeVideoController =
      Get.put(YoutubeVideoController());
  @override
  void initState() {
    youtubeVideoController.handleGetYoutubeVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Obx(
        () => Column(
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            Expanded(
                child: youtubeVideoController.isLoading.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: youtubeVideoController.youtubeVideos.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(YoutubeVideoSingle(
                                  youtubeVideoId: youtubeVideoController
                                      .youtubeVideos[index].videoId));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network(
                                      youtubeVideoController
                                          .youtubeVideos[index].imageUrl,
                                      fit: BoxFit.cover,
                                    )),
                                title: Text(youtubeVideoController
                                    .youtubeVideos[index].title),
                                subtitle: Text(youtubeVideoController
                                    .youtubeVideos[index].description),
                              ),
                            ),
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
