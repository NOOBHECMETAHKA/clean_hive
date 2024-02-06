import 'package:mebel_shop_hive/features/mebel/data/model/mebel_model.dart';
import 'package:mebel_shop_hive/features/mebel/domains/entity/mebel_entity.dart';

extension MebelMapperModel on MebelModel {
  MebelEntity toEntity() {
    return MebelEntity(
        article: article,
        name: name,
        category: category,
        description: description,
        price: price,
        count: count);
  }
}

extension MebelMapperEntity on MebelEntity {
  MebelModel toModel() {
    return MebelModel(
        article: article,
        name: name,
        category: category,
        description: description,
        price: price,
        count: count);
  }
}
