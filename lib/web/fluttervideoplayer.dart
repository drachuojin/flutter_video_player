import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class FluttervideoplayerPlugin {
  static void registerWith(Registrar registrar) {
    // 仿照安卓插件添加默认静态方法即可
    final MethodChannel channel = new MethodChannel("fluttervideoplayer", const StandardMethodCodec(), registrar.messenger); //通讯channel
    final webPlugin = FluttervideoplayerPlugin();
    channel.setMethodCallHandler(webPlugin.handler); // 消息处理
  }

  Future<dynamic> handler(MethodCall call) {
    if (call.method == 'getPlatformVersion') {
      return Future.value('Chrome 11');
    }
    return null;
  }
}
