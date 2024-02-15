import 'package:get_it/get_it.dart';
import 'package:mebel_shop_hive/features/mebel/data/data_source/mebel_local_hive.dart';
import 'package:mebel_shop_hive/features/mebel/data/repository/mebel_repositoty_impl.dart';
import 'package:mebel_shop_hive/features/mebel/domains/repository/mebel_repository.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';

final service = GetIt.instance;

Future<void> init() async {
  service.registerLazySingleton(() => MebelController(service()));

  service.registerLazySingleton<MebelLocalHive>(() => MebelLocalHiveImpl());
  service.registerLazySingleton<MebelRepository>(
      () => MebelRepositoryImpl(local: service()));

  await service<MebelLocalHive>().initDb();
}


