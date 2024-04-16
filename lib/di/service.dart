import 'package:get_it/get_it.dart';
import 'package:mebel_shop_hive/features/mebel/data/data_source/mebel_local_hive.dart';
import 'package:mebel_shop_hive/features/mebel/data/repository/mebel_repositoty_impl.dart';
import 'package:mebel_shop_hive/features/mebel/domains/repository/mebel_repository.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/bloc/mebel_bloc.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/cubit/mebel_cubit.dart';

final service = GetIt.instance;

Future<void> init() async {

  service.registerLazySingleton<MebelCubit>(() => MebelCubit(service<MebelRepository>()));
  service.registerLazySingleton<MebelBloc>(() => MebelBloc(service<MebelRepository>()));

  service.registerLazySingleton(() => MebelController(service()));

  service.registerLazySingleton<MebelLocalHive>(() => MebelLocalHiveImpl());//True
  service.registerLazySingleton<MebelRepository>(() => MebelRepositoryImpl(local: service()));//True

  await service<MebelLocalHive>().initDb();
}


