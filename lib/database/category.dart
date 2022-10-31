import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:money_management/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_management/screens/category/income_list.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

abstract class CategoryDbFuctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String id);
}

class CategoryDB implements CategoryDbFuctions {
  CategoryDB._internal();
  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeList = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseList = ValueNotifier([]);
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final s = value.toMap();
    await _db.collection("categoryList").add(s);
    refreshUI();

    // .doc(value.uid)
    // .set({'name': value.name, 'deleted': value.isDeleted, 'type': value.type});
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("categoryList").get();
    return snapshot.docs
        .map((docSnapshot) =>
            CategoryModel.fromDocumentSnapshot(docSnapshot, false))
        .toList();
  }

  Future<void> refreshUI() async {
    final _allCategory = await getCategories();
    incomeList.value.clear();
    expenseList.value.clear();
    await Future.forEach(_allCategory, (CategoryModel category) {
      if (category.type == 'Income') {
        incomeList.value.add(category);
      } else {
        expenseList.value.add(category);
      }
    });
    incomeList.notifyListeners();
    expenseList.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String id) async {
    await _db.collection("categoryList").doc(id).delete();
    refreshUI();
  }
}
