import 'package:mebel_shop_hive/features/mebel/domains/entity/mebel_entity.dart';
import 'package:mebel_shop_hive/features/mebel/domains/repository/mebel_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mebel_event.dart';
part 'mebel_state.dart';

class MebelBloc extends Bloc<MebelBlocEvent, MebelBlocState> {
  final MebelRepository _repo;
  MebelBloc(this._repo) : super(MebelBlocInitialState()) {
    on<OnClickCategoryMebelObject>(_onMebelByCategory);
  }

  Future<void> _onMebelByCategory(
      OnClickCategoryMebelObject event, Emitter<MebelBlocState> emit) async {
    emit(IsLoadingBlocState());

    List<MebelEntity> data = await _repo.writeMebel();
    data =
        data.where((element) => element.category == event.fCategory).toList();

    emit(IsLoadedBlocState(mebels: data));
  }
}
