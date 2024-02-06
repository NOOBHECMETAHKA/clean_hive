import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/di/service.dart';
import 'package:mebel_shop_hive/features/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
