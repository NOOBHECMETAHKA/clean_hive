import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/widget/custem_app_bar.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/widget/mebel_card.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustemAppBar(),
      body: switch(context.select<MebelController, MebelState>((value) => value.state)){
        MebelState.initial || MebelState.loading || MebelState.error => const Center(child: CircularProgressIndicator()),
        MebelState.success => ListView.builder(
        itemCount: context.select<MebelController, int>((value) => value.getMebelList.length),
        itemBuilder: (context, index) => MebelCard(index: index)),
      }
    );
  }
}
