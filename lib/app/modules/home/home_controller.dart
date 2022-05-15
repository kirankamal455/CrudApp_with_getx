import 'package:crud_app_flutter/app/data/model/data_model.dart';
import 'package:crud_app_flutter/app/data/services/local_database.dart';
import 'package:crud_app_flutter/app/global/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final mylist = <StudentModel>[].obs;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController rollnoController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    rollnoController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    rollnoController.dispose();
  }

  Future<void> addStudentButtonClicked() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final rollno = rollnoController.text.trim();
    int? id;

    if (name.isEmpty || age.isEmpty || rollno.isEmpty) {
      k = 1;
      return;
    }
    final studentdata =
        StudentModel(id: id, name: name, age: age, rollno: rollno);

    CrudDB().addStudent(studentdata);
  }

  Future<void> updateStudentDetails(int id) async {
    await CrudDB().updateStudent(
        id, nameController.text, ageController.text, rollnoController.text);

    Get.rawSnackbar(
      message: 'Successfully updated a Student',
      backgroundColor: Colors.yellow,
    );
    CrudDB().getAllStudentsDetails();
  }
}
