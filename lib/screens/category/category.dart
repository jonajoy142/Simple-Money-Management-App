// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/database/category.dart';
import 'package:money_management/screens/category/expence_list.dart';
import 'package:money_management/screens/category/income_list.dart';

import '../BottomNavigation/bottomNavigation.dart';

class CategoryScreen extends StatefulWidget {
  final String title;

  const CategoryScreen({super.key, required this.title});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().getCategories().then((value) {
      print("category list");
      print(value.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Income',
              ),
              Tab(
                text: 'Expence',
              ),
            ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: const [
            IncomeList(),
            ExpenseList(),
          ]),
        )
      ],
    );
  }
}
