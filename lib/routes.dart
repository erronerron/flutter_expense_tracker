import 'package:flutter_expense_tracker/pages/expense/expense.dart';
import 'package:flutter_expense_tracker/pages/home/home.dart';
import 'package:flutter_expense_tracker/pages/test/test.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/expenses': (context) => const ExpenseScreen(),
  '/tests': (context) => const TestScreen(),
};
