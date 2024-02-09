enum Pages {
  home,
  addProduct,
  aboutProduct,
  updateProduct,
  selectedProducts,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.home => '/',
      Pages.addProduct => 'product-add',
      Pages.aboutProduct => 'product-about',
      Pages.updateProduct => 'product-update',
      Pages.selectedProducts => 'product-selected'
    };
  }

  String get screenName {
    return switch (this) {
      Pages.home => 'HOME',
      Pages.updateProduct => "PRODUCTUPDATEFORM",
      Pages.addProduct => 'PRODUCTADDFORM',
      Pages.aboutProduct => 'ABOURPRODUCT',
      Pages.selectedProducts => 'PRODUCTSELECTED'
    };
  }
}
