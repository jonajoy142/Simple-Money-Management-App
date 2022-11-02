import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money_management/models/category.dart';
import 'package:money_management/models/transactions.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

abstract class TransactionDbFuctions {
  Future<List<TransationModel>> getTransactions();
  Future<void> insertTransactions(TransationModel value);
  // Future<void> deleteCategory(String id);
}

class TransactionDB implements TransactionDbFuctions {
  // @override
  // Future<void> deleteCategory(String id) {}

  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransationModel>> transactionListN = ValueNotifier([]);

  @override
  Future<void> insertTransactions(TransationModel value) async {
    await _db.collection("TransactionList").add(value.toMap());
    refreshUI();
  }

  Future<void> refreshUI() async {
    final _allTransactions = await getTransactions();
    print("hry");
    transactionListN.value.clear();

    await Future.forEach(_allTransactions, (TransationModel category) {
    
        transactionListN.value.add(category);
      
    });
  
    // print("hry");
    // transactionListN.value.addAll(_allTransactions);
    print("hry");
    transactionListN.notifyListeners();
    print("hry");
  }

  @override
  Future<List<TransationModel>> getTransactions() async {
    
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("TransactionList").get();
       
    return snapshot.docs.map((docSnapshot) => TransationModel.fromDocumentSnapshot(
              docSnapshot,
            )).toList();
        
  }
}
