import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/widget/mebel_page.dart';
import 'package:provider/provider.dart';

class AboutMebel extends StatelessWidget {
  const AboutMebel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Инфа"), actions: [
        IconButton(
            onPressed: () {
              if (context.read<MebelController>().getSavedObjectMebel != null) {
                context.read<MebelController>().deleteMebel(
                    context.read<MebelController>().getSavedObjectMebel!);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: const Text("Объект не найден!"),
                      action: SnackBarAction(
                        label: "Ok ( -_-)",
                        onPressed: () {},
                        textColor: Colors.white,
                      )),
                );
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete))
      ]),
      body: switch (
          context.select<MebelController, MebelState>((value) => value.state)) {
        MebelState.initial ||
        MebelState.loading ||
        MebelState.error =>
          const Center(child: CircularProgressIndicator()),
        MebelState.success => const MebelPage(),
      },
    );
  }
}
