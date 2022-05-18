import 'package:crud_app_flutter/app/data/repository/student/i_student_repository.dart';
import 'package:crud_app_flutter/app/data/repository/student/student_repository.dart';

import 'package:crud_app_flutter/app/data/services/db/i_db_service.dart';
import 'package:crud_app_flutter/app/modules/home/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IStudentRepository>(
        () => StudentRepository(dbService: Get.find<IDbService>()));

    Get.lazyPut(() =>
        DataController(studentRepository: Get.find<IStudentRepository>()));
  }
}
