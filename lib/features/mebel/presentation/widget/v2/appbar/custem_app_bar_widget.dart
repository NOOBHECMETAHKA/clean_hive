import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/routes/app_router.dart';
import 'package:mebel_shop_hive/routes/router_utils.dart';


class CustemAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustemAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Список мебели: "),
      actions: [
        IconButton(
            onPressed: () {
              AppRouter.router.goNamed(Pages.addProduct.screenName);
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
