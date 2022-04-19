import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/provider/test_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<TestProvider>().tests;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Total Tests ${_myList.length}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tests');
              },
              child: const Text('View tests'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/expenses');
              },
              child: const Text('View expenses'),
            )
          ],
        ),
      ),
    );
  }
}
