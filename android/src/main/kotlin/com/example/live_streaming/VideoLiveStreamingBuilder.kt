package com.example.video_live_streaming

import android.content.Context
import androidx.lifecycle.Lifecycle
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

class VideoLiveStreamingBuilder {
    fun build(id: Int, context: Context?, binaryMessenger: BinaryMessenger, lifecycleProvider: LifecycleProvider): PlatformView {
        return VideoLiveStreamingController(id, context!!, binaryMessenger, lifecycleProvider)
    }
}