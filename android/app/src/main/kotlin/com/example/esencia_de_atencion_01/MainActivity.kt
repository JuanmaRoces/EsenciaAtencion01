package com.rocesit.esencia0

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {
  private val CHANNEL = "www.rocesit.esencia0/back_button"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "sendToBackground") {
        moveTaskToBack(true)
      }
      // Note: this method is invoked on the main thread.
      // TODO
    }
    
  }
}
