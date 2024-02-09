class YoutubeChannelModel {
  String? kind;
  String? videoId;
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  String? imageUrl;

  YoutubeChannelModel({
    this.kind,
    this.videoId,
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.imageUrl,
  });

  factory YoutubeChannelModel.fromJson(Map<String, dynamic> json) {
    return YoutubeChannelModel(
      kind: json['kind'],
      videoId: json['id']['videoId'],
      publishedAt: json['snippet']['publishedAt'],
      channelId: json['snippet']['channelId'],
      title: json['snippet']['title'],
      description: json['snippet']['description'],
      imageUrl: json['snippet']['thumbnails']['default']['url'],
    );
  }
}
