import 'dart:convert';

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

  StudentModel copyWith({
    int? id,
    String? name,
    String? age,
    String? rollno,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      rollno: rollno ?? this.rollno,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    result.addAll({'age': age});
    result.addAll({'rollno': rollno});

    return result;
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      age: map['age'] ?? '',
      rollno: map['rollno'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentModel(id: $id, name: $name, age: $age, rollno: $rollno)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentModel &&
        other.id == id &&
        other.name == name &&
        other.age == age &&
        other.rollno == rollno;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ age.hashCode ^ rollno.hashCode;
  }
}











// import 'dart:convert';

// class StudentModel {
//   int? id;
//   final String name;
//   final String age;
//   final String rollno;
//   StudentModel({
//     this.id,
//     required this.name,
//     required this.age,
//     required this.rollno,
//   });

//   StudentModel copyWith({
//     int? id,
//     String? name,
//     String? age,
//     String? rollno,
//   }) {
//     return StudentModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       age: age ?? this.age,
//       rollno: rollno ?? this.rollno,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     if (id != null) {
//       result.addAll({'id': id});
//     }
//     result.addAll({'name': name});
//     result.addAll({'age': age});
//     result.addAll({'rollno': rollno});

//     return result;
//   }

//   factory StudentModel.fromMap(Map<String, dynamic> map) {
//     return StudentModel(
//       id: map['id']?.toInt(),
//       name: map['name'] ?? '',
//       age: map['age'] ?? '',
//       rollno: map['rollno'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory StudentModel.fromJson(String source) =>
//       StudentModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'StudentModel(id: $id, name: $name, age: $age, rollno: $rollno)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is StudentModel &&
//         other.id == id &&
//         other.name == name &&
//         other.age == age &&
//         other.rollno == rollno;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^ name.hashCode ^ age.hashCode ^ rollno.hashCode;
//   }
// }
