import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_management/database/category.dart';
import 'package:money_management/firebase_options.dart';
import 'package:money_management/screens/Home/homeScreen.dart';
import 'package:money_management/screens/transactions/add-transactions.dart';

void main() async {
  final obj1 = CategoryDB();
  final obj2 = CategoryDB();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(title: 'Money Management App'),
      routes: {
        AddTransactions.routeName: ((context) =>
         const AddTransactions()
        )
      },
    );
  }
}
