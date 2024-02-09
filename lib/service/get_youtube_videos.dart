import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wordpower_app/model/youtube_channel_model.dart';

Future<List<YoutubeChannelModel>> getYoutubeVideo() async {
  var response = await http.get(Uri.parse(
      "https://www.googleapis.com/youtube/v3/search?key=AIzaSyBqazoXuT0DQhwopkf92z81Xy5tsr_oAt0&channelId=UCR_Rn21bNrAqK0fHgatW9Ww&part=snippet,id&order=date&maxResults=100"));

  var responseData = jsonDecode(response.body);

  if (response.statusCode == 200) {
    List youtubeVideos = responseData['items'];
    return youtubeVideos.map((e) => YoutubeChannelModel.fromJson(e)).toList();
  } else {
    throw Exception(response.statusCode);
  }
}
