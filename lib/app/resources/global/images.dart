class Images {
  static String logo = assetPath('logo/main.svg');

  static String assetPath(
    String assetName, {
    String basePath = 'lib/app/resources/assets/',
  }) {
    return basePath + assetName;
  }
}
