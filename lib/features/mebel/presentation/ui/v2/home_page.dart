import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/bloc/mebel_bloc.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/cubit/mebel_cubit.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/widget/v2/appbar/custem_app_bar_widget.dart';
import 'package:mebel_shop_hive/routes/app_router.dart';
import 'package:mebel_shop_hive/routes/router_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _categoriesCollection = <String>[
      'Столы',
      'Кровати',
      'Тумбочки',
      'Шкафы'
    ];

    return Scaffold(
        appBar: const CustemAppBarWidget(),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoriesCollection.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              context.read<MebelBloc>().add(
                                  OnClickCategoryMebelObject(
                                      fCategory: _categoriesCollection[index]));
                                  AppRouter.router
                                    .goNamed(Pages.selectedProducts.screenName);
                            },
                            child: Text(_categoriesCollection[index])),
                      );
                    })),
            Expanded(
              flex: 8,
              child: BlocBuilder<MebelCubit, MebelState>(
                  builder: (context, state) {
                return switch (state) {
                  MebelInitial() => const Center(
                      child: Text('Добро пожаловать в приложение!'),
                    ),
                  MebelLoading() => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  MebelSuccecss() => ListView.builder(
                      itemCount: context.read<MebelCubit>().getMebelList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text((index + 1).toString()),
                          title: Text(context
                              .read<MebelCubit>()
                              .getMebelList[index]
                              .name),
                          onTap: () {
                            print(context
                                .read<MebelCubit>()
                                .getMebelList[index]
                                .name);
                          },
                          subtitle: Text(
                              "Количество: ${context.read<MebelCubit>().getMebelList[index].count}"),
                          trailing: IconButton.outlined(
                              onPressed: () {
                                context.read<MebelCubit>().setSavedMebel(context
                                    .read<MebelCubit>()
                                    .getMebelList[index]);
                                AppRouter.router
                                    .goNamed(Pages.aboutProduct.screenName);
                              },
                              icon: const Icon(Icons.apps_sharp)),
                        );
                      }),
                  MebelError() => const Center(
                      child: Text('Ошибка!'),
                    )
                };
              }),
            )
          ],
        ));
  }
}
