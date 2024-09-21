import 'dart:convert';

class Employee {
  final int id;
  final String name;
  final int estimatedHours;
  final int squadId;
  Employee({
    required this.id,
    required this.name,
    required this.estimatedHours,
    required this.squadId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'estimatedHours': estimatedHours,
      'squadId': squadId,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    var p = "";
    return Employee(
      id: map['id'],
      name: map['name'] ?? '',
      estimatedHours: map['estimatedhours'],
      squadId: map['squadid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) => Employee.fromMap(json.decode(source));
}
