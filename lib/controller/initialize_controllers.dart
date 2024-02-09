import 'package:get/get.dart';
import 'package:wordpower_app/controller/get_bible_chapter_controller.dart';
import 'package:wordpower_app/controller/youtube_video_controller.dart';

import 'get_post_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GetBibleChaptersController());
    Get.put(YoutubeVideoController());
    Get.put(GetPostController());
  }
}
