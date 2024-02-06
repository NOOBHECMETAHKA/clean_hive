import 'package:hive/hive.dart';

part 'mebel_model.g.dart';

@HiveType(typeId: 0)
class MebelModel {
  @HiveField(0)
  final String article;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String description;
  @HiveField(4, defaultValue: 0)
  final double price;
  @HiveField(5, defaultValue: 0)
  final int count;

  MebelModel(
      {required this.article,
      required this.name,
      required this.category,
      required this.description,
      required this.price,
      required this.count});
}
