import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/di/service.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/bloc/mebel_bloc.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/cubit/mebel_cubit.dart';
import 'package:mebel_shop_hive/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MebelCubit>(create: (BuildContext context) => service<MebelCubit>()..init()),
      BlocProvider<MebelBloc>(create: (BuildContext context) => service<MebelBloc>()),
    ], 
    child: MaterialApp.router(
        theme: ThemeData.dark(),
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}