import 'package:crud_app_flutter/app/data/model/student_model.dart';
import 'package:crud_app_flutter/app/data/repository/student/i_student_repository.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_result/multiple_result.dart';

class DataController extends GetxController
    with StateMixin<List<StudentModel>> {
  late IStudentRepository studentRepository;

  DataController({required this.studentRepository});

  final details = <StudentModel>[];
  late TextEditingController nameController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController rollnoController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    rollnoController = TextEditingController();
    getAllStudent();
  }

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
      change(details, status: RxStatus.error(error.toString()));
    }, (success) {
      ///refresh the list
      /// change(students, status: RxStatus.success());
      getAllStudent();
    });
    return result;
  }

  Future<Result<Exception, List<StudentModel>>> getAllStudent() async {
    var result = await studentRepository.getAllStudent();

    result.when((error) {
      change(details, status: RxStatus.error(error.toString()));
    }, (success) {
      change(details, status: RxStatus.success());
    });
    return result;
  }

  Future<Result<Exception, int>> updateStudentDetails(int id) async {
    var result = await studentRepository.updateStudentDetails(
        id: id,
        name: nameController.text,
        age: ageController.text,
        rollno: rollnoController.text);
    result.when((error) {
      change(details, status: RxStatus.error(error.toString()));
    }, (success) => getAllStudent());
    return result;
  }

  Future<Result<Exception, int>> deleteStudent(int id) async {
    var result = await studentRepository.deleteStudentDetails(id);
    result.when((error) {
      change(details, status: RxStatus.error(error.toString()));
    }, (success) => getAllStudent());
    return result;
  }
}
