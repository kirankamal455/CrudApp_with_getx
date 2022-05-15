import 'package:crud_app_flutter/app/data/model/data_model.dart';
import 'package:crud_app_flutter/app/data/provider/api_provider.dart';
import 'package:crud_app_flutter/app/modules/home/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sqflite/sqflite.dart';

final DataController dataController = Get.put(DataController());
late Database db1;

class CrudDB extends Apicalls {
  //open the database
  @override
  Future<void> initializeDataBase() async {
    db1 = await openDatabase('students.db', version: 1,
        onCreate: (Database db, int version) async {
      // Students Table creation
      await db.execute(
          'CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT,age TEXT,rollno TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)');
    });
  }

  //insert the student data to  database
  @override
  Future<void> addStudent(StudentModel value) async {
    dataController.mylist.add(value);
    final time = DateTime.now().toString();
    await db1.rawInsert(
        'INSERT INTO students(id,name, age,rollno,createdAt) VALUES(?,?, ?,?,?)',
        [value.id, value.name, value.age, value.rollno, time]);

    getAllStudentsDetails();
  }

  //Editing  an existing student
  @override
  Future<void> updateStudent(
      int id, String name, String age, String rollno) async {
    await db1.rawUpdate(
        'UPDATE students SET name=? , age =? ,rollno =? WHERE id=?',
        [name, age, rollno, id]);
    getAllStudentsDetails();
  }

  //get the all students data from database
  @override
  Future<void> getAllStudentsDetails() async {
    dataController.mylist.clear();
    final values =
        await db1.rawQuery('SELECT * FROM students ORDER BY createdAt DESC ');
    dataController.mylist.clear();
    //Get each map on by one
    for (var map in values) {
      final student = StudentModel.fromMap(map);
      dataController.mylist.add(student);
    }
  }

  //delete the student data from database
  @override
  Future<void> deleteStudent(int id) async {
    final db = db1;
    await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
    dataController.mylist.clear();
    getAllStudentsDetails();
  }
}
