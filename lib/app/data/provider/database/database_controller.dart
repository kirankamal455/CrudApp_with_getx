import 'package:crud_app_flutter/app/data/provider/database/database_functions.dart';
import 'package:crud_app_flutter/app/global/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/data_model.dart';

class DataController extends GetxController {
  final mylist = <StudentModel>[].obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController rollnoController = TextEditingController();

  Future<void> addStudentButtonClicked() async {
    final _name = nameController.text.trim();
    final _age = ageController.text.trim();
    final _rollno = rollnoController.text.trim();
    int? id;

    if (_name.isEmpty || _age.isEmpty || _rollno.isEmpty) {
      k = 1;
      return;
    }
    final _studentdata =
        StudentModel(id: id, name: _name, age: _age, rollno: _rollno);
    DatabaseHelper.instance.addStudent(_studentdata);
  }

  Future<void> updateStudentDetails(int id) async {
    await DatabaseHelper.instance.updateStudent(
        id, nameController.text, ageController.text, rollnoController.text);

    Get.rawSnackbar(
      message: 'Successfully updated a Student',
      backgroundColor: Colors.yellow,
    );
    DatabaseHelper.instance.getAllStudentsDetails();
  }
}
