import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mebel_shop_hive/di/service.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/about_mebel.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/add_mebel.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/ui/home.dart';
import 'package:mebel_shop_hive/routes/router_utils.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Pages.home.screenPath,
        name: Pages.home.screenName,
        builder: (context, state) => ChangeNotifierProvider(create: 
        (context) => service<MebelController>()..init(),
        child: const Home(),),
        routes: [
          GoRoute(
            path: Pages.aboutProduct.screenPath,
            name: Pages.aboutProduct.screenName,
            builder: (context, state) => ChangeNotifierProvider(create:
                (context) => service<MebelController>()..init(),
              child: const AboutMebel(),),
          ),
          GoRoute(
            path: Pages.addProduct.screenPath,
            name: Pages.addProduct.screenName,
            builder: (context, state) => ChangeNotifierProvider(create:
                (context) => service<MebelController>()..init(),
              child: const AddMebel(),),
          ),
        ]
      ),
    ]
  );
}
