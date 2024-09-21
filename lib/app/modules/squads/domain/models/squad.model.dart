import 'dart:convert';

class Squad {
  final int id;
  final String name;
  Squad({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Squad.fromMap(Map<String, dynamic> map) {
    return Squad(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Squad.fromJson(String source) => Squad.fromMap(json.decode(source));
}
