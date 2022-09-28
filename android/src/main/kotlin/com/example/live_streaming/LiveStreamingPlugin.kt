package com.example.live_streaming

import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter

class LiveStreamingPlugin : FlutterPlugin, ActivityAware {
  private var lifecycle: Lifecycle? = null

  companion object {
    private const val VIEW_TYPE_ID = "video_live_streaming"

    @Suppress("deprecation")
    fun registerWith(registrar: io.flutter.plugin.common.PluginRegistry.Registrar) {
      val activity = registrar.activity() ?: return

      if (activity is LifecycleOwner) {
        registrar
          .platformViewRegistry()
          .registerViewFactory(
            VIEW_TYPE_ID,
            VideoLiveStreamingFactory(
              registrar.messenger(),
              object : LifecycleProvider {
                override fun getLifecycle(): Lifecycle? {
                  return (activity as LifecycleOwner).lifecycle
                }

              }
            )
          )
      }
    }
  }

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    binding
      .platformViewRegistry
      .registerViewFactory(
        VIEW_TYPE_ID,
        VideoLiveStreamingFactory(
          binding.binaryMessenger,
          object : LifecycleProvider {
            override fun getLifecycle(): Lifecycle? {
              return lifecycle
            }
          }
        )
      )
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivity() {
    lifecycle = null
  }
}
