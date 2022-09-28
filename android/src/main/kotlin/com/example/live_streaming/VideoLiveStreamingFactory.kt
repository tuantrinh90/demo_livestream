package com.example.live_streaming

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class VideoLiveStreamingFactory(
    private val binaryMessenger: BinaryMessenger,
    private val lifecycleProvider: LifecycleProvider
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    @Suppress("UNCHECKED_CAST")
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val builder = VideoLiveStreamingBuilder()
        return builder.build(viewId, context, binaryMessenger, lifecycleProvider)
    }
}