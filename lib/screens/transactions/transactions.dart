import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../BottomNavigation/bottomNavigation.dart';

class TransactionScreen extends StatelessWidget {
  final String title;

  const TransactionScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
        itemBuilder: ((context, index) {
          // ignore: prefer_const_constructors
          return Card(
            elevation: 0,
            child: ListTile(
              // ignore: prefer_const_constructors
              leading: CircleAvatar(
                backgroundColor:Color.fromARGB(255, 246, 241, 242) ,
                radius: 50,
                child: Text(
                  "27\nJun",
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text("RS:10000"),
              subtitle: Text("Travel"),
            ),
          );
        }),
        separatorBuilder: ((context, index) {
          return SizedBox(
            height: 10,
          );
        }),
        itemCount: 10);
  }
}
