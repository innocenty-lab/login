// To parse this JSON data, do
//
//     final EnrollList = EnrollListFromJson(jsonString);

// ignore_for_file: file_names

import 'package:meta/meta.dart';
import 'dart:convert';

EnrollList parseFromJson(String str) => EnrollList.fromJson(json.decode(str));

String parseToJson(EnrollList data) => json.encode(data.toJson());

class EnrollList {
  EnrollList({
    required this.data,
  });

  List<Enroll> data;

  factory EnrollList.fromJson(Map<String, dynamic> json) => EnrollList(
        data: List<Enroll>.from(json["data"].map((x) => Enroll.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Enroll {
  Enroll({
    required this.id,
    required this.iscomplete,
    required this.kelas,
  });

  int id;
  bool iscomplete;
  Kelas kelas;

  factory Enroll.fromJson(Map<String, dynamic> json) => Enroll(
        id: json["id"],
        iscomplete: json["iscomplete"],
        kelas: Kelas.fromJson(json["kelas"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iscomplete": iscomplete,
        "kelas": kelas.toJson(),
      };
}

class Kelas {
  Kelas({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nama;
  String deskripsi;
  DateTime createdAt;
  DateTime updatedAt;

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
