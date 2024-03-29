import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/domains/entity/mebel_entity.dart';
import 'package:mebel_shop_hive/features/mebel/domains/repository/mebel_repository.dart';

import 'package:uuid/uuid.dart';

enum MebelState {
  initial,
  loading,
  success,
  error,
}

class MebelController with ChangeNotifier {
  MebelController(this._repo);

  final MebelRepository _repo;
  List<MebelEntity> _mebelList = [];
  List<MebelEntity> get getMebelList => _mebelList;

  MebelEntity? _savedObjectMebel;
  MebelEntity? get getSavedObjectMebel => _savedObjectMebel;

  MebelState state = MebelState.initial;

  Future<void> init() async {
    state = MebelState.loading;
    _mebelList = await _repo.writeMebel();
    state = MebelState.success;
    notifyListeners();
  }

  Future<void> setSavedMebel(MebelEntity entity) async {
    state = MebelState.loading;
    _savedObjectMebel = await _repo.findMebel(entity);
    state = MebelState.success;
    notifyListeners();
  }

  Future<void> addMebel(String name, String category, String description,
      double? price, int? count) async {
    price = price ?? 0;
    count = count ?? 0;

    final entity = MebelEntity(
        article: const Uuid().v1(),
        name: name,
        category: category,
        description: description,
        price: price,
        count: count);

    await _repo.readMebel(entity);

    init();
    notifyListeners();
  }

  Future<void> deleteMebel(MebelEntity entity) async {
    await _repo.deleteMebel(entity);
    init();
    notifyListeners();
  }
}
