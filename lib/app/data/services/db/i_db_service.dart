import 'package:crud_app_flutter/app/data/model/student_model.dart';

abstract class IDbService {
  Future<void> initializeDataBase();
  Future<int> addStudent(StudentModel value);
  Future<List<StudentModel>> getAllStudentsDetails();
  Future<int> updateStudent(int id, String name, String age, String rollno);
  Future<int> deleteStudent(int id);
}
