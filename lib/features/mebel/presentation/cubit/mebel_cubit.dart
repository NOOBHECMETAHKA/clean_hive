import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:mebel_shop_hive/features/mebel/domains/entity/mebel_entity.dart';
import 'package:mebel_shop_hive/features/mebel/domains/repository/mebel_repository.dart';
import 'package:uuid/uuid.dart';

part 'mebel_state.dart';

class MebelCubit extends Cubit<MebelState> {
  final MebelRepository _repo;
  MebelCubit(this._repo) : super(MebelInitial());
  List<MebelEntity> _mebelList = [];
  List<MebelEntity> get getMebelList => _mebelList;
  List<MebelEntity> _selectedMebels = [];
  List<MebelEntity> get getSelectedMebels => _selectedMebels;
  MebelEntity? _savedObjectMebel;
  MebelEntity? get getSavedObjectMebel => _savedObjectMebel;
  Future<void> init() async {
    emit(MebelLoading());
    _mebelList = await _repo.writeMebel();
    emit(MebelSuccecss());
  }
  Future<void> setSavedMebel(MebelEntity entity) async {
    emit(MebelLoading());
    _savedObjectMebel = await _repo.findMebel(entity);
    emit(MebelSuccecss());
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
    emit(MebelLoading());
    _mebelList = await _repo.writeMebel();
    emit(MebelSuccecss());
  }
  Future<void> updatMebel(String article, String name, String category,
      String description, double? price, int? count) async {
    emit(MebelLoading());
    price = price ?? 0;
    count = count ?? 0;
    MebelEntity entity = MebelEntity(
        article: article,
        name: name,
        category: category,
        description: description,
        price: price,
        count: count);
    await _repo.updateMebel(entity);
    emit(MebelLoading());
    _mebelList = await _repo.writeMebel();
    emit(MebelSuccecss());
  }
  Future<void> deleteMebel(MebelEntity entity) async {
    await _repo.deleteMebel(entity);
    emit(MebelLoading());
    _mebelList = await _repo.writeMebel();
    emit(MebelSuccecss());
  }
}
