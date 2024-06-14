import 'dart:convert';

class AddProfile {
  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  AddProfile({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory AddProfile.fromJson(String str) =>
      AddProfile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddProfile.fromMap(Map<String, dynamic> json) => AddProfile(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
