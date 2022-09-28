import 'package:flutter/material.dart';
import 'package:live_streaming/live_streaming.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin video live streaming example'),
      ),
      body: _buildVideoLiveStreamingWidget(),
    );
  }

  Widget _buildVideoLiveStreamingWidget() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: VideoLiveStreamingView(
        onCreated: (controller) {
          controller.startStreaming(Configuration(
              appId: '088300519c194e81a67b1f7925b47296',
              accessToken: '006088300519c194e81a67b1f7925b47296IADwVFvTmjhe2fGUDIXPkUlvqqhaNANb/aoUX++g1AfeMEncfOMNvtUaEAAROAEA4qc1YwEAAQAiKzZj',
              channelId: 'butai-channel-111',
              uid: 2));
        },
        onCompletion: (controller) {

        },
      ),
    );
  }
}
