package com.awd.mayim;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }
}

//package com.awd.mayim;
//import androidx.annotation.NonNull;
//import io.flutter.embedding.android.FlutterActivity;
//import io.flutter.embedding.engine.FlutterEngine;
//import io.flutter.plugins.GeneratedPluginRegistrant;
//
//
//public class MainActivity extends FlutterActivity {
//    private static final String CHANNEL = "samples.flutter.dev/battery";
//
//    @Override
//    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//                .setMethodCallHandler(
//                        (call, result) -> {
//                            // Your existing code
//                        }
//                );
//    }
//    // You do not need to override onCreate() in order to invoke
//    // GeneratedPluginRegistrant. Flutter now does that on your behalf.
//
//    // ...retain whatever custom code you had from before (if any).
//}