import 'package:crud_app_flutter/app/data/model/student_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IStudentRepository {
  Future<Result<Exception, int>> addAstudentDetails(
      {required StudentModel studentModel});
  Future<Result<Exception, int>> updateStudentDetails(
      {required int id,
      required String name,
      required String age,
      required String rollno});
  Future<Result<Exception, List<StudentModel>>> getAllStudent();
  Future<Result<Exception, int>> deleteStudentDetails(int id);
}
