part of video_live_streaming;

class LiveStreamingController {
  /// MethodChannel to call methods from the platform
  final MethodChannel _channel;

  /// Constructor of the class
  LiveStreamingController._(this._channel) {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  /// Initialize the controller
  static Future<LiveStreamingController> init(int id) async {
    final MethodChannel channel = MethodChannel('com.example.live_streaming/video_live_streaming_$id');
    return LiveStreamingController._(channel);
  }

  Future<void> startStreaming(Configuration config) async {
    try {
      await _channel.invokeMethod('stream#startStream', config.toJson());
    } catch (ex) {
      ex.toString();
    }
  }

  Future<void> setOrientationLiveStreaming(OrientationMode mode) async {
    try {
      Map<String, dynamic> args = {"orientation": mode.name};
      await _channel.invokeMethod('stream#orientation', args);
    } catch (ex) {
      ex.toString();
    }
  }

  Future<void> mute(SoundMode sound) async {
    try {
      Map<String, dynamic> args = {"sound": sound.name};
      await _channel.invokeMethod('stream#sound', args);
    } catch (ex) {
      ex.toString();
    }
  }

  Future<dynamic> _handleMethodCall(MethodCall call) async {}
}
