import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:mebel_shop_hive/routes/app_router.dart';
import 'package:mebel_shop_hive/routes/router_utils.dart';
import 'package:provider/provider.dart';

class MebelCard extends StatelessWidget {
  final int index;

  const MebelCard({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.read<MebelController>().getMebelList[index].name),
      subtitle: Text(
          "Количество: ${context.read<MebelController>().getMebelList[index].count}"),
      trailing: IconButton.outlined(
          onPressed: () {
            context.read<MebelController>().setSavedMebel(context.read<MebelController>().getMebelList[index]);
            AppRouter.router.goNamed(Pages.aboutProduct.screenName);
          },
          icon: const Icon(Icons.apps_sharp)),
    );
  }
}
