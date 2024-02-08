enum Pages {
  home,
  addProduct,
  aboutProduct,
  updateProduct,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.home => '/',
      Pages.addProduct => 'product-add',
      Pages.aboutProduct => 'product-about',
      Pages.updateProduct => 'product-update'
    };
  }

  String get screenName {
    return switch (this) {
      Pages.home => 'HOME',
      Pages.updateProduct => "PRODUCTUPDATEFORM",
      Pages.addProduct => 'PRODUCTADDFORM',
      Pages.aboutProduct => 'ABOURPRODUCT',
    };
  }
}
