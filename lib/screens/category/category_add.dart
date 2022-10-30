import 'package:flutter/material.dart';

ValueNotifier<String> selectedIndex = ValueNotifier('Income');
Future<void> openDilougeBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Category'),
          content: Container(
            height: 160,
            child: Column(
              children:  [
             const Padding(
                padding: const EdgeInsets.all(8.0),
                child: const  TextField(
                    // controller: _nameController,
                    decoration: InputDecoration(hintText: 'Category Name',border: OutlineInputBorder()),
                  
                  ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  
                  child: Row(
                    children: [
                      RaadioButton(type: 'Income', title: 'Income'),
                      RaadioButton(type: 'Expense', title: 'Expense')
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  // submit(context);
                  // Navigator.of(context).pop(context);
                  // print(userId);
                },
                child: Text('Submit')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: Text('Cancel'))
          ],
        );
      });
}

class RaadioButton extends StatelessWidget {
  final String type;
  final String title;

  const RaadioButton({super.key, required this.type, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: ((BuildContext context , String newCat, _) {
              return Radio<String>(
                  value: type,
                  groupValue: selectedIndex.value,
                  onChanged: ((value) {
                    if (value == null) return;
                    selectedIndex.value = value;
                    selectedIndex.notifyListeners();
                     
                  }));
             
            })),
            Text(title)
            
      ],
    );
  }
}
