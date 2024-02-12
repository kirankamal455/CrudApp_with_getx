import 'package:crud_app_flutter/app/core/theme/app_theme.dart';
import 'package:crud_app_flutter/app/data/services/db/db_service.dart';
import 'package:crud_app_flutter/app/data/services/db/i_db_service.dart';
import 'package:crud_app_flutter/app/routes/app_pages.dart';
import 'package:crud_app_flutter/app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Get.putAsync<IDbService>(
      () async => await DbService().initializeDataBase());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login App',
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}
// ddfdfx