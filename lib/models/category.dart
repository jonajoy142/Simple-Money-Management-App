// ignore_for_file: empty_constructor_bodies

import 'package:cloud_firestore/cloud_firestore.dart';

// enum CategoryType { income, expense }

class CategoryModel {
  final String? uid;
  final String name;
  final bool isDeleted;
  final String type;

  CategoryModel({
    this.uid,
    required this.name,
    this.isDeleted = false,
    required this.type,
  });

  @override
  String toString() {
    return '$name  $type';
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "uid": uid, "deleted": isDeleted, "type": type};
  }

  CategoryModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc, this.isDeleted)
      : uid = doc.id,
        name = doc.data()!['name'],
        type = doc.data()!['type'];
}
