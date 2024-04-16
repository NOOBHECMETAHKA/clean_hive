import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/cubit/mebel_cubit.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/widget/v2/subpage/mebel_subpage_wiget.dart';
import 'package:mebel_shop_hive/routes/app_router.dart';
import 'package:mebel_shop_hive/routes/router_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutMebelPage extends StatelessWidget {
  const AboutMebelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Инфа"), actions: [
        IconButton(onPressed: (){
          AppRouter.router.goNamed(Pages.updateProduct.screenName);
        }, icon: const Icon(Icons.edit)),
        IconButton(
            onPressed: () {
              if (context.read<MebelCubit>().getSavedObjectMebel != null) {
                context.read<MebelCubit>().deleteMebel(
                    context.read<MebelCubit>().getSavedObjectMebel!);
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
      body: BlocBuilder<MebelCubit, MebelState>(builder: (context, state) {
        return switch(state){
          MebelInitial() => const Center(
            child: Text('Инициализация объекта!')),
          MebelLoading() => const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
          MebelSuccecss() => const MebelSubPageWidget(),
          MebelError() => const Center(
            child: Text('Ошибка!'),
          )
        };
      },
    ));
  }
}
