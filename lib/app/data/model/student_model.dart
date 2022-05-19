class StudentModel {
  int? id;
  final String name;
  final String age;
  final String rollno;
  StudentModel({
    this.id,
    required this.name,
    required this.age,
    required this.rollno,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      age: map['age'] ?? '',
      rollno: map['rollno'] ?? '',
    );
  }
}
