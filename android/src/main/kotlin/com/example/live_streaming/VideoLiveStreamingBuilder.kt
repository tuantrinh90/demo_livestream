package com.example.live_streaming

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

class VideoLiveStreamingBuilder {
    fun build(id: Int, context: Context?, binaryMessenger: BinaryMessenger, lifecycleProvider: LifecycleProvider): PlatformView {
        return VideoLiveStreamingController(id, context!!, binaryMessenger, lifecycleProvider)
    }
}