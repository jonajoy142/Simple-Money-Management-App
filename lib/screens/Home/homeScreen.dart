// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/screens/BottomNavigation/bottomNavigation.dart';
import 'package:money_management/screens/category/category.dart';
import 'package:money_management/screens/transactions/transactions.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({super.key, required this.title});
  static ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final _page = [
    TransactionScreen(title: "TRANSACTION PAGE "),
    CategoryScreen(title: "CATEGORY PAGE ")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 132, 131, 131),
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 73, 20, 31),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.settings),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 97, 3, 23))),
          ),
        ],
      ),
      body: Center(
       
          child: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, int updatedIndex, _) {
          return _page[updatedIndex];
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndex.value == 0) {
         
            print("transatuions");
          } else {
            
            print("category");
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 97, 3, 23),
      ),
    );
  }
}
