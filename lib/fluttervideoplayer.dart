import 'dart:async';
import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttervideoplayer/IVideoPlayer.dart';
import 'package:fluttervideoplayer/web/WebVideoPlayer.dart';

const String viewType = 'fluttervideoplayer/video';

class Fluttervideoplayer {
  static const MethodChannel _channel = const MethodChannel('fluttervideoplayer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

class FlutterVideoPlayerView extends StatefulWidget {
  String src;

  FlutterVideoPlayerView(this.src);

  @override
  State<StatefulWidget> createState() {
    return FlutterVideoPlayerViewState();
  }
}

class FlutterVideoPlayerViewState extends State<FlutterVideoPlayerView> {
  IVideoPlayer videoPlayer;

  @override
  void initState() {
    if (kIsWeb) {
      videoPlayer = WebVideoPlayer();
      videoPlayer.setSrc(widget.src);
      ui.platformViewRegistry.registerViewFactory(viewType, (viewId) {
        return videoPlayer.getView();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        child: _nativeView(),
        width: double.infinity,
      ),
      onTap: () {
        print("    =======================点击了");
      },
    );
  }

  Widget _nativeView() {
    return HtmlElementView(
      viewType: viewType,
    );
  }

  void setSrc(String src) {
    videoPlayer.setSrc(src);
  }

  Future<void> play() {
    return videoPlayer.play().catchError((e) {
      DomException exception = e;
      print(e);
    }, test: (e) => e is DomException);
  }
}
