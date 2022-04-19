import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/test_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<TestProvider>().tests;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tests'),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (_, index) {
            final currentExpense = _myList[index];
            return Card(
              key: ValueKey(currentExpense.description),
              elevation: 4,
              child: ListTile(
                title: Text(currentExpense.description),
                subtitle: Text(currentExpense.amount.toString()),
                trailing: TextButton(
                  child: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    context.read<TestProvider>().removeFromList(currentExpense);
                  },
                ),
              ),
            );
          }),
    );
  }
}
