import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:provider/provider.dart';

class SelectedMebels extends StatelessWidget {
  const SelectedMebels({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<MebelController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Выбранные элементы:"),),
      body: ListView.builder(
        itemCount: provider.getSelectedMebels.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(provider.getSelectedMebels[index].name),
              subtitle: Text(
                  "Количество: ${provider.getSelectedMebels[index].count}"),
                  trailing: Text(provider.getSelectedMebels[index].category),);
        },
      ),
    );
  }
}
