import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/database/category.dart';
import 'package:date_format/date_format.dart';
import 'package:money_management/models/category.dart';

class AddTransactions extends StatefulWidget {
  static const routeName = 'add-transactions';
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  DateTime? _selectedDate;
  String? _selectedcatType;
  CategoryModel? _selectedCategory;
  TextEditingController dateinput = TextEditingController();
  String? _categoryId;

  ValueNotifier<String> selectedIndex = ValueNotifier('Income');
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    _selectedcatType = 'Income'; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Purpose", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Amount', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),

                /* DATE  */

                TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(Duration(
                            days:
                                30)), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          formatDate(pickedDate, [dd, '/', M, '/', yy]);

                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),

                /* END OF DATE */

                /* RADIO BUTTON */

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 'Income',
                            groupValue: _selectedcatType,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedcatType = 'Income';
                                _categoryId = null;
                              });
                            }),
                        Text('Income')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'Expense',
                            groupValue: _selectedcatType,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedcatType = 'Expense';
                                _categoryId = null;
                              });
                            }),
                        Text('Expense')
                      ],
                    ),
                  ],
                ),
                DropdownButton<String>(
                    hint: Text('Select Category'),
                    value: _categoryId,
                    items: (_selectedcatType == 'Income'
                            ? CategoryDB().incomeList
                            : CategoryDB().expenseList)
                        .value
                        .map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e.uid,
                      );
                    }).toList(),
                    onChanged: (selectedValue) {
                      setState(() {
                        _categoryId = selectedValue;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.check),
                  onPressed: () {},
                  label: Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
