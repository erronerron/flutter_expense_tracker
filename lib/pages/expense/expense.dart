import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/model.dart';
import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Row(
        children: [],
      ),
    );
  }
}

Future<void> addExpenses() async {
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
  }
  return;
}
