import 'package:go_router/go_router.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/v2/about_mebel_page.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/v2/add_mebel_page.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/v2/edit_mebel_page.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/v2/home_page.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/v2/selected_category_page.dart';
import 'package:mebel_shop_hive/routes/router_utils.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(debugLogDiagnostics: true, routes: [
    GoRoute(
        path: Pages.home.screenPath,
        name: Pages.home.screenName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: Pages.aboutProduct.screenPath,
            name: Pages.aboutProduct.screenName,
            builder: (context, state) => const AboutMebelPage(),
            routes: [
              GoRoute(
                  path: Pages.updateProduct.screenPath,
                  name: Pages.updateProduct.screenName,
                  builder: (context, state) => const EditMebelPage()
                )
            ]
          ),
          GoRoute(
            path: Pages.selectedProducts.screenPath,
            name: Pages.selectedProducts.screenName,
            builder: (context, state) => const SelectedCategoryPage()
          ),
          GoRoute(
            path: Pages.addProduct.screenPath,
            name: Pages.addProduct.screenName,
            builder: (context, state) => const AddMebelPage()
          )
        ]
    )
  ]);
}
