part of video_live_streaming;

/// Callback that is called when the view is created and ready.
typedef ViewCreateCallback = void Function(LiveStreamingController controller);

/// Callback that is called when the playback of a video is completed.
typedef CompletionCallback = void Function(LiveStreamingController controller);

class VideoLiveStreamingView extends StatelessWidget {

  final String? appId;

  /// Instance of [ViewCreatedCallback] to notify
  /// when the view is finished creating.
  final ViewCreateCallback onCreated;

  /// Instance of [CompletionCallback] to notify
  /// when a video has finished playing.
  final CompletionCallback onCompletion;

  const VideoLiveStreamingView({
    required this.appId,
    required this.onCreated,
    required this.onCompletion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final Map<String, dynamic> creationParams = <String, dynamic>{
        'appId': appId
      };
      return AndroidView(
        viewType: 'video_live_streaming',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'video_live_streaming',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParams: null,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return Text('$defaultTargetPlatform is not yet supported by this plugin.');
  }

  Future<void> onPlatformViewCreated(int id) async {
    final LiveStreamingController controller =
    await LiveStreamingController.init(id);
    onCreated(controller);
  }
}
