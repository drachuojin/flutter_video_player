import 'dart:html';

import 'package:flutter/src/gestures/events.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:fluttervideoplayer/IVideoPlayer.dart';
import 'dart:html' as html;
import 'dart:js' as JS;
import 'package:flutter/services.dart';

class WebVideoPlayer extends IVideoPlayer {
  VideoElement video;

  String _url = "";

  WebVideoPlayer() {
    video = VideoElement();
    video.width = 200;
    video.controls = true;
    video.style.border = "none";
    print("WebVideoPlayer");
  }

  @override
  Future<void> play() {
    print("play");
  }

  @override
  void setSrc(String src) {
    video.src = src;
    video.play();
   // video.enterFullscreen();
    print("setSrc");
  }

  void _loadUrl(String url) {}

  @override
  Object getView() {
    return video;
  }
}
