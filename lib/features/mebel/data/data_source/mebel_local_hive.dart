import 'package:flutter/foundation.dart';
import 'package:mebel_shop_hive/features/mebel/data/model/mebel_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class MebelLocalHive {
  Future<bool> initDb();
  Future<void> readMebel(MebelModel model);
  Future<List<MebelModel>> writeMebel();
  Future<void> updateMebel(MebelModel model);
  Future<void> deleteMebel(MebelModel model);
  Future<MebelModel> findMebel(MebelModel model);
}

class MebelLocalHiveImpl implements MebelLocalHive {
  final _kObjectBox = 'mebel_object_box';

  @override
  Future<bool> initDb() async {
    if (!kIsWeb) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }
    Hive.registerAdapter(MebelAdapter());
    await Hive.openBox<MebelModel>(_kObjectBox);
    return true;
  }

  @override
  Future<MebelModel> readMebel(MebelModel model) async {
    final obejctBox = Hive.box<MebelModel>(_kObjectBox);
    await obejctBox.put(model.article, model);
    return model;
  }

  @override
  Future<void> updateMebel(MebelModel model) async {
    final objectBox = Hive.box<MebelModel>(_kObjectBox);
    objectBox.put(model.article, model);
  }

  @override
  Future<List<MebelModel>> writeMebel() async {
    final obejctBox = Hive.box<MebelModel>(_kObjectBox);
    return obejctBox.values.toList();
  }

  @override
  Future<void> deleteMebel(MebelModel mebelModel) async {
    final obejectBox = Hive.box<MebelModel>(_kObjectBox);

    List<MebelModel> allValues = obejectBox.values.toList();
    for (var i = 0; i < allValues.length; i++) {
      if (allValues.elementAt(i).article == mebelModel.article) {
        obejectBox.deleteAt(i);
        break;
      }
    }
  }

  @override
  Future<MebelModel> findMebel(MebelModel mebelModel) async {
    final obejectBox = Hive.box<MebelModel>(_kObjectBox);
    return obejectBox.values
        .where((element) => element.article == mebelModel.article)
        .first;
  }
}
