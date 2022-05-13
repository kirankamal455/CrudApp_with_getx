class StudentModel {
  int? id;
  final String name;
  final String age;
  final String rollno;

  StudentModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.rollno});

  //To convert the given Map to the  class
  static StudentModel fromMap(Map<String, Object?> map) {       
    final id = map['id'] as int; 
    final name = map['name'] as String;
    final rollno = map['rollno'] as String;
    final age = map['age'] as String;
    return StudentModel(id: id, name: name, age: age, rollno: rollno);
  }
}
