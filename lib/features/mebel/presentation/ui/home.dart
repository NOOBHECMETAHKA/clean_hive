import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/widget/custem_app_bar.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/widget/mebel_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void makeFilter(int index, BuildContext context, bool isDeleted) {
    if (isDeleted) {
      context.read<MebelController>().deleteSelectedMebel(index);
    } else {
      context.read<MebelController>().insertSelectedMebel(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustemAppBar(),
        body: switch (context
            .select<MebelController, MebelState>((value) => value.state)) {
          MebelState.initial ||
          MebelState.loading ||
          MebelState.error =>
            const Center(child: CircularProgressIndicator()),
          MebelState.success => Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: context.read<MebelController>().getSelectedMebels.length,
                      itemBuilder: (context, index) => Chip(
                        onDeleted: () =>
                            makeFilter(index, context, true),
                        label: Text(context.read<MebelController>().getSelectedMebels.elementAt(index).name),
                      ),
                    )),
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                      itemCount: context.select<MebelController, int>(
                          (value) => value.getMebelList.length),
                      itemBuilder: (context, index) => MebelCard(
                          index: index,
                          onTap: () => makeFilter(
                              index,
                              context,
                              false))),
                ),
              ],
            )
        });
  }
}
