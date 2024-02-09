import 'package:get/get.dart';
import 'package:wordpower_app/service/get_youtube_videos.dart';

import '../model/youtube_channel_model.dart';

late Future<List<YoutubeChannelModel>> youtube;

class YoutubeVideoController extends GetxController {
  var youtubeVideos = [].obs;
  var isLoading = false.obs;

  handleGetYoutubeVideos() {
    isLoading.value = true;
    youtube = getYoutubeVideo();
    youtube.then((value) {
      isLoading.value = false;
      youtubeVideos.value = value;
    });
  }

  @override
  void onInit() {
    handleGetYoutubeVideos();
    super.onInit();
  }
}
