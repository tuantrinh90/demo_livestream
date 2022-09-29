part of video_live_streaming;

class Configuration {
  final String? appId;
  final String? accessToken;
  final String? channelId;
  final int uid;

  Configuration(
      {required this.appId,
      required this.accessToken,
      required this.channelId,
      required this.uid});

  Map<String, dynamic> toJson() => {
        "appId": appId,
        "accessToken": accessToken,
        "channelId": channelId,
        "uid": uid
      };
}

enum SoundMode { mute, unmute }

enum OrientationMode { portrait, landscape }