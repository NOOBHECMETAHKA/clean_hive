part of 'mebel_bloc.dart';

@immutable
sealed class MebelBlocEvent {}

class OnClickCategoryMebelObject extends MebelBlocEvent {
  final String fCategory;

  OnClickCategoryMebelObject({required this.fCategory});
}
