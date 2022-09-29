import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_streaming/live_streaming.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLandscape = false;

  LiveStreamingController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildVideoLiveStreamingWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!isLandscape) {
              isLandscape = true;
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);
              _controller?.setOrientationLiveStreaming(OrientationMode.landscape);
            } else {
              isLandscape = false;
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
              _controller?.setOrientationLiveStreaming(OrientationMode.portrait);
            }
            setState(() {});
          },
          child: Icon(Icons.change_circle),
        ),
      ),
    );
  }

  Widget _buildVideoLiveStreamingWidget() {
    return Container(
      alignment: Alignment.center,
      child: VideoLiveStreamingView(
        onCreated: (controller) {
          _controller = controller;
          controller.startStreaming(Configuration(
              appId: '088300519c194e81a67b1f7925b47296',
              accessToken:
              '006a023c5b9b23344c1a40e901d3900c0eeIADR5QKiyEzaCWCjQlTY4rTEiGhIlU8+xtlEdz/91zG6LEncfOMNvtUaEABLEAAAHbc2YwEAAQBdOjdj',
              channelId: 'butai-channel-111',
              uid: 2));
        },
        onCompletion: (controller) {},
      ),
    );
  }
}
