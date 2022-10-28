import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IncomeList extends StatelessWidget {
  const IncomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              title: Text('Expense List $index'),
              trailing: IconButton(onPressed: (){},icon: Icon(Icons.delete),),
            ),
          );;
        }),
        separatorBuilder: ((context, index) {
          return SizedBox(
            height: 10,
          );
        }),
        itemCount: 10);
  }
}
