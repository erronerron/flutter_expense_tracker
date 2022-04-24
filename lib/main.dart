import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/model.dart';
import 'package:flutter_expense_tracker/routes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'provider/test_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isInitialized = await ExpenseDBModel().initializeDB();
  if (isInitialized) runSamples();
  print(isInitialized);

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

Future<bool> runSamples() async {
  // add sample categories
  await addSampleCategories();

  // add sample expenses
  await addSampleExpenses();

  return true;
}

Future<void> addSampleCategories() async {
  final category = await Category().select().toSingle();
  if (category == null) {
    await Category(
      name: 'Food',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Category(
      name: 'Electricity',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Category(
      name: 'Water',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    print('Sample categories successfully created');
    return;
  }
  print(
      'Error creating sample categories. There are categories already created.');
  return;
}

Future<void> addSampleExpenses() async {
  final expense = await Expense().select().toSingle();
  final category = await Category().select().toSingle();
  DateTime datetime =
      DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

  if (expense == null && category != null) {
    await Expense(
      description: 'Lunch',
      amount: 100,
      paid_at: datetime,
      categoryId: category.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Expense(
      description: 'Electricity Bill',
      amount: 1000,
      paid_at: datetime,
      categoryId: category.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Expense(
      description: 'Water bill',
      amount: 500,
      paid_at: datetime,
      categoryId: category.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();

    print('Sample expenses successfully created');
    return;
  }
  print('Error creating sample expenses. There are expenses already created.');
  return;
}
