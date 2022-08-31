const assetsPath = 'lib/app/resources/assets/';

class Path {
  static String assets(
    String assetName, {
    String? basePath,
  }) {
    basePath = basePath ?? assetsPath;
    return basePath + assetName;
  }

  static String json(
    String assetName, {
    String? basePath,
  }) {
    basePath = basePath ?? '${assetsPath}json/';
    return basePath + assetName;
  }
}
