// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_management/screens/Home/homeScreen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreen.selectedIndex,
      builder: (BuildContext ctx, int updatedIndex, Widget?_) {
        return BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 97, 3, 23),
          
          currentIndex: updatedIndex,
          onTap: (newIndex) {
            HomeScreen.selectedIndex.value = newIndex;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Transations",
            ),
            BottomNavigationBarItem(
      
              icon: Icon(Icons.category),
              label: "Category",
            )
          ],
        );
      },
    );
  }
}
