import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:mebel_shop_hive/routes/app_router.dart';
import 'package:mebel_shop_hive/routes/router_utils.dart';
import 'package:provider/provider.dart';

class CustemAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Список мебели: "),
      actions: [
        IconButton(
            onPressed: () {
              if (context.read<MebelController>().getSelectedMebels.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Количество выбранных элеметов - 0'),
                      content: const Text('Для перехода на страницу с сохранёными объектами выберете объекты!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Хорошо!'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                AppRouter.router.goNamed(Pages.selectedProducts.screenName);
              }
            },
            icon: const Icon(Icons.find_in_page)),
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
