import 'package:mebel_shop_hive/features/mebel/domains/entity/mebel_entity.dart';

abstract class MebelRepository {
  Future<List<MebelEntity>> writeMebel();
  Future<void> readMebel(MebelEntity entity);
  Future<void> updateMebel(MebelEntity entity);
  Future<void> deleteMebel(MebelEntity entity);
  Future<MebelEntity> findMebel(MebelEntity entity);
}
