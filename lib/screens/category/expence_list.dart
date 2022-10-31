import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/database/category.dart';
import 'package:money_management/models/category.dart';
import '';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().expenseList,
        builder: ((BuildContext ctx, List<CategoryModel> newList, _) {
          return ListView.separated(
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    title: Text(newList[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(newList[index].uid.toString());
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 10,
                );
              }),
              itemCount: newList.length);
        }));
  }
}
