import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/database/category.dart';
import 'package:money_management/database/transaction.dart';
import 'package:money_management/models/transactions.dart';

import '../BottomNavigation/bottomNavigation.dart';

class TransactionScreen extends StatelessWidget {
  final String title;

  const TransactionScreen({super.key, required this.title});

  // with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUI();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListN,
        builder: ((BuildContext ctx, List<TransationModel> newList, _) {
          return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: ((ctx, index) {
                // ignore: prefer_const_constructors
                print("fdfdfd");
                return Stack(
                  children: [

                    Padding(padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text("Do you want to delete"),
                        Row(
                          children: [
                            TextButton(onPressed: (){}, child: Text("Yes")),
                            TextButton(onPressed: (){}, child: Text("Yes")),

                          ],
                        )
                      ],
                    ),
                    ),

                     Dismissible(
                    key: key!,
                    child: Card(
                      elevation: 0,
                      child: ListTile(
                        // ignore prefer_const_constructors
                        leading: CircleAvatar(
                          backgroundColor: (newList[index].categoryType == 'Income'
                              ? Colors.red
                              : Colors.green),
                          radius: 50,
                          child: Text(
                            parseDate(newList[index].date),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        title: Text("RS ${newList[index].amount}"),
                        subtitle: Text(newList[index].category.name),
                      ),
                    ),
                  ),
                  ],
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

  String parseDate(DateTime? date) {
    return '${date!.day}\n${date.month}';
  }
}
