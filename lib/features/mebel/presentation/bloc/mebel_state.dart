part of 'mebel_bloc.dart';

@immutable
sealed class MebelBlocState {}

final class MebelBlocInitialState extends MebelBlocState {}

final class IsLoadingBlocState extends MebelBlocState {}

final class IsLoadedBlocState extends MebelBlocState {
  final List<MebelEntity> mebels;

  IsLoadedBlocState({required this.mebels});
}
