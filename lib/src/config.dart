part of video_live_streaming;

class Configuration {
  final String? accessToken;
  final String? channelId;
  final int uid;

  Configuration(
      {required this.accessToken, required this.channelId, required this.uid});

  Map<String, dynamic> toJson() =>
      {"accessToken": accessToken, "channelId": channelId, "uid": uid};
}

enum OrientationMode { portrait, landscape }
