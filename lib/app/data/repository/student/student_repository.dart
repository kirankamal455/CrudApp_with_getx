import 'package:crud_app_flutter/app/data/model/student_model.dart';

import 'package:crud_app_flutter/app/data/services/db/i_db_service.dart';

import 'package:multiple_result/multiple_result.dart';

import 'i_student_repository.dart';

class StudentRepository implements IStudentRepository {
  late IDbService dbService;

  StudentRepository({required this.dbService});

  @override
  Future<Result<Exception, int>> addAstudentDetails(
      {required StudentModel studentModel}) async {
    var result = await dbService.addStudent(studentModel);
    if (result == 0) {
      getAllStudent();
      return Success(result);
    } else {
      return Error(Exception("Error adding student"));
    }
  }

  @override
  Future<Result<Exception, int>> updateStudentDetails(
      {required int id,
      required String name,
      required String age,
      required String rollno}) async {
    var result = await dbService.updateStudent(id, name, age, rollno);
    if (result == 0) {
      return Success(result);
    } else {
      return Error(Exception("Error update student details"));
    }
  }

  @override
  Future<Result<Exception, List<StudentModel>>> getAllStudent() async {
    try {
      var result = await dbService.getAllStudentsDetails();
      print(result);
      return Success(result);
    } catch (e) {
      return Error(e as Exception);
    }
  }

  @override
  Future<Result<Exception, int>> deleteStudentDetails(int id) async {
    var result = await dbService.deleteStudent(id);

    if (result == 0) {
      return Success(result);
    } else {
      return Error(Exception("error delete"));
    }
  }
}
