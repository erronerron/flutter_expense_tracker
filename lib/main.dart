import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/routes.dart';
import 'package:provider/provider.dart';
import 'provider/test_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TestProvider>(
    child: const MyApp(),
    create: (_) => TestProvider(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
