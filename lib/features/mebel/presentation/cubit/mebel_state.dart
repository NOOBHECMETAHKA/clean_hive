part of 'mebel_cubit.dart';

@immutable
sealed class MebelState {}

class MebelInitial extends MebelState {}

class MebelLoading extends MebelState {}

class MebelSuccecss extends MebelState {}

class MebelError extends MebelState {}