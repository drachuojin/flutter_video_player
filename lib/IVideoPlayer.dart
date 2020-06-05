abstract class IVideoPlayer {

  void setSrc(String src);

  Future<void> play();

  Object getView();
}
