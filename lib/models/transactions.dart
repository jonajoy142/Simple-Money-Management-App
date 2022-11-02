import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money_management/models/category.dart';

class TransationModel {
   String? uid;
  final String? purpose;
  final double? amount;
  final DateTime? date;
  final String? categoryType;
  final CategoryModel category;

  TransationModel(
      {this.uid,
      required this.purpose,
      required this.amount,
      required this.date,
      required this.categoryType,
      required this.category}) {
    uid = DateTime.now().millisecondsSinceEpoch.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      "purpose": purpose,
      "uid": uid,
      "amount": amount,
      "type": categoryType
    };
  }

  TransationModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        purpose = doc.data()!['purpose'],
        amount = doc.data()!['amount'],
        date = doc.data()!['date'],
        category = doc.data()!['category'],
        categoryType = doc.data()!['categoryType'];
}
