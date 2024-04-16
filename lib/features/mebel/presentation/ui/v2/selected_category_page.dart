import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/bloc/mebel_bloc.dart';

class SelectedCategoryPage extends StatelessWidget {
  const SelectedCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Выбранные элементы:"),
      ),
      body: BlocBuilder<MebelBloc, MebelBlocState>(
        builder: (context, state) {
          return switch (state) {
            MebelBlocInitialState() => const Center(
                child: Text('Добро пожаловать в приложение!'),
              ),
            IsLoadingBlocState() => const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            IsLoadedBlocState() => ListView.builder(
                itemCount: state.mebels.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(state.mebels[index].name),
                  );
                },
              )
          };
        },
      ),
    );
  }
}
