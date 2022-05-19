import 'package:crud_app_flutter/app/data/model/student_model.dart';
import 'package:crud_app_flutter/app/data/repository/student/i_student_repository.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_result/multiple_result.dart';

class DataController extends GetxController
    with StateMixin<List<StudentModel>> {
  late IStudentRepository studentRepository;

  DataController({required this.studentRepository});

  late TextEditingController nameController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController rollnoController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllStudent();
    nameController = TextEditingController();
    ageController = TextEditingController();
    rollnoController = TextEditingController();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   getAllStudent();
  // }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    rollnoController.dispose();
  }

  Future<Result<Exception, int>> addStudentButtonClicked() async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final rollno = rollnoController.text.trim();

    var result = await studentRepository.addAstudentDetails(
        studentModel: StudentModel(name: name, age: age, rollno: rollno));

    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (success) async {
      ///refresh the list
      await getAllStudent();
    });
    return result;
  }

  Future<Result<Exception, List<StudentModel>>> getAllStudent() async {
    var result = await studentRepository.getAllStudent();

    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (students) {
      change(null, status: RxStatus.loading());
      change(students, status: RxStatus.success());
    });

    return result;
  }

  Future<Result<Exception, int>> updateStudentDetails(int id) async {
    var result = await studentRepository.updateStudent(
        id: id,
        name: nameController.text,
        age: ageController.text,
        rollno: rollnoController.text);
    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (success) async {
      await getAllStudent();
    });
    return result;
  }

  Future<Result<Exception, int>> deleteStudent(int id) async {
    var result = await studentRepository.deleteStudentDetails(id);
    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (success) async {
      await getAllStudent();
    });
    return result;
  }
}
