enum Pages {
  home,
  addProduct,
  aboutProduct,
  settings,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.home => '/',
      Pages.addProduct => 'product-add',
      Pages.aboutProduct => 'product-about',
      Pages.settings => 'settings',
    };
  }

  String get screenName {
    return switch (this) {
      Pages.home => 'HOME',
      Pages.addProduct => 'PRODUCTADDFORM',
      Pages.aboutProduct => 'ABOURPRODUCT',
      Pages.settings => 'SETTINGS',
    };
  }
}
