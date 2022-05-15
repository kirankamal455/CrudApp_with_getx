import 'package:crud_app_flutter/app/data/model/data_model.dart';

abstract class Apicalls {
  Future<void> initializeDataBase();
  Future<void> addStudent(StudentModel value);
  Future<void> getAllStudentsDetails();
  Future<void> updateStudent(int id, String name, String age, String rollno);
  Future<void> deleteStudent(int id);
}
