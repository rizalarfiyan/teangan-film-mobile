class Images {
  //* Logo
  static String logo = assetPath('logo/main.svg');

  //* Images
  static String userAvatar = assetPath('images/rizal.jpg');

  static String assetPath(
    String assetName, {
    String basePath = 'lib/app/resources/assets/',
  }) {
    return basePath + assetName;
  }
}
