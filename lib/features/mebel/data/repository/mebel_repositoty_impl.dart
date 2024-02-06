import 'package:mebel_shop_hive/features/mebel/data/data_source/mebel_local_hive.dart';
import 'package:mebel_shop_hive/features/mebel/data/mapper/mebel_mapper.dart';
import 'package:mebel_shop_hive/features/mebel/domains/entity/mebel_entity.dart';
import 'package:mebel_shop_hive/features/mebel/domains/repository/mebel_repository.dart';

class MebelRepositoryImpl implements MebelRepository {
  final MebelLocalHive local;

  MebelRepositoryImpl({required this.local});

  @override
  Future<void> deleteMebel(MebelEntity entity) async {
    local.deleteMebel(entity.toModel());
  }

  @override
  Future<void> readMebel(MebelEntity entity) async {
    await local.readMebel(entity.toModel());
  }

  @override
  Future<void> updateMebel(MebelEntity entity) async {
    await local.updateMebel(entity.toModel());
  }

  @override
  Future<List<MebelEntity>> writeMebel() async {
    final data = await local.writeMebel();
    final result = data.map((e) => e.toEntity()).toList();
    return result;
  }

  @override
  Future<MebelEntity> findMebel(MebelEntity entity) async {
    final data = await local.findMebel(entity.toModel());
    return data.toEntity();
  }
}
