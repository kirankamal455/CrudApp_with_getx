import 'package:crud_app_flutter/app/data/model/data_model.dart';
import 'package:crud_app_flutter/app/data/provider/database/database_controller.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final DataController dataController = Get.put(DataController());
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//open the database
  late Database _db;
  Future<void> initializeDataBase() async {
    _db = await openDatabase('students.db', version: 1,
        onCreate: (Database db, int version) async {
      // Students Table creation
      await db.execute(
          'CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT,age TEXT,rollno TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)');
    });
  }

//insert the student data to  database
  Future<void> addStudent(StudentModel value) async {
    dataController.mylist.add(value);
    final time = DateTime.now().toString();
    await _db.rawInsert(
        'INSERT INTO students(id,name, age,rollno,createdAt) VALUES(?,?, ?,?,?)',
        [value.id, value.name, value.age, value.rollno, time]);

    getAllStudentsDetails();
  }

//get the all students data from database
  Future<void> getAllStudentsDetails() async {
    dataController.mylist.clear();
    final _values =
        await _db.rawQuery('SELECT * FROM students ORDER BY createdAt DESC ');
    dataController.mylist.clear();
    //Get each map on by one
    for (var map in _values) {
      final student = StudentModel.fromMap(map);
      dataController.mylist.add(student);
    }
  }

//Editing  an existing student
  Future<void> updateStudent(
      int id, String name, String age, String rollno) async {
    await _db.rawUpdate(
        'UPDATE students SET name=? , age =? ,rollno =? WHERE id=?',
        [name, age, rollno, id]);
    getAllStudentsDetails();
  }

//delete the student data from database
  Future<void> deleteStudent(int id) async {
    final db = _db;
    await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
    dataController.mylist.clear();
    getAllStudentsDetails();
  }
}
