import 'package:crud_app_flutter/app/data/model/student_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'i_db_service.dart';

class DbService extends GetxService implements IDbService {
  late Database db1;

  //open the database
  @override
  Future<DbService> initializeDataBase() async {
    db1 = await openDatabase('students.db', version: 1,
        onCreate: (Database db, int version) async {
      // Students Table creation
      await db.execute(
          'CREATE TABLE students ( name TEXT,age TEXT,rollno TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)');
    });
    return this;
  }

  //insert the student data to  database
  @override
  Future<int> addStudent(StudentModel studentmodel) async {
    final time = DateTime.now().toString();
    return await db1.rawInsert(
        'INSERT INTO students(name, age,rollno,createdAt) VALUES(?, ?,?,?)',
        [studentmodel.name, studentmodel.age, studentmodel.rollno, time]);
  }

  //Editing  an existing student
  @override
  Future<int> updateStudent(
      int id, String name, String age, String rollno) async {
    return await db1.rawUpdate(
        'UPDATE students SET name=? , age =? ,rollno =? WHERE id=?',
        [name, age, rollno, id]);
  }

  //get the all students data from database
  @override
  Future<List<StudentModel>> getAllStudentsDetails() async {
    var students = <StudentModel>[];

    final values =
        await db1.rawQuery('SELECT * FROM students ORDER BY createdAt DESC ');

    //Get each map on by one
    for (var map in values) {
      final student = StudentModel.fromMap(map);
      students.add(student);
    }

    return students;
  }

  //delete the student data from database
  @override
  Future<int> deleteStudent(int id) async {
    final db = db1;
    return await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
