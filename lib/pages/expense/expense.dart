import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/controllers/expense_controller.dart';
import '../../models/expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  late ExpenseController expenseHandler;

  Future<int> addExpenses() async {
    Expense firstExpense = Expense(
        id: 1,
        categoryId: 1,
        description: "Food",
        amount: 24,
        paidAt: DateTime.now().toString(),
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString());
    Expense secondExpense = Expense(
        id: 2,
        categoryId: 1,
        description: "Transpo",
        amount: 31,
        paidAt: DateTime.now().toString(),
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString());
    Expense thirdExpense = Expense(
        id: 3,
        categoryId: 1,
        description: 'Electricity',
        amount: 4,
        paidAt: DateTime.now().toString(),
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString());
    Expense fourthExpense = Expense(
        id: 4,
        categoryId: 1,
        description: 'Water',
        amount: 5,
        paidAt: DateTime.now().toString(),
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString());
    Expense fifthExpense = Expense(
        id: 5,
        categoryId: 1,
        description: 'Sumthin',
        amount: 5,
        paidAt: DateTime.now().toString(),
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString());

    List<Expense> expenses = [
      firstExpense,
      secondExpense,
      thirdExpense,
      fourthExpense,
      fifthExpense
    ];
    return await expenseHandler.insertExpenses(expenses);
  }

  @override
  void initState() {
    super.initState();
    expenseHandler = ExpenseController();
    expenseHandler.initializedDB().whenComplete(() async {
      await addExpenses();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: FutureBuilder(
        future: expenseHandler.retrieveExpenses(),
        builder: (BuildContext context, AsyncSnapshot<List<Expense>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(snapshot.data![index].description +
                        snapshot.data![index].paidAt),
                    subtitle: Text(snapshot.data![index].amount.toString()),
                    trailing: ElevatedButton(
                      onPressed: () async {
                        await expenseHandler
                            .deleteExpense(snapshot.data![index].id);
                        setState(() {});
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
