class AssetManager {
  static AssetManager _instance = AssetManager._init();
  static AssetManager get instance => _instance;

  AssetManager._init();

  String lottiePath(String lottie) => "assets/lottie/$lottie.json";
  String assetImagePath(String imgName) => "assets/images/$imgName";
  String assetIconPath(String icon) => "assets/icons/$icon";
}
