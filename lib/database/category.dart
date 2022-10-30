import 'package:money_management/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

abstract class CategoryDbFuctions {
 Future< List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDbFuctions {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    await _db.collection("categoryList").add(value.toMap());

    // .doc(value.uid)
    // .set({'name': value.name, 'deleted': value.isDeleted, 'type': value.type});
  }

  
  @override
   Future<List<CategoryModel>> getCategories() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("categoryList").get();
    return snapshot.docs
        .map((docSnapshot) => CategoryModel.fromDocumentSnapshot(docSnapshot,false))
        .toList();
  }
}
