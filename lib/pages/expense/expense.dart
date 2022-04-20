import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/utils/database_helper.dart';
import '../../models/expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  late DataBase handler;

  Future<int> addExpenses() async {
    Expense firstExpense = Expense(id: 1, description: "Food", amount: 24);
    Expense secondExpense = Expense(id: 2, description: "Transpo", amount: 31);
    Expense thirdExpense =
        Expense(id: 3, description: 'Electricity', amount: 4);
    Expense fourthExpense = Expense(id: 4, description: 'Water', amount: 5);
    Expense fifthExpense = Expense(id: 5, description: 'Sumthin', amount: 5);

    List<Expense> expenses = [
      firstExpense,
      secondExpense,
      thirdExpense,
      fourthExpense,
      fifthExpense
    ];
    return await handler.insertExpenses(expenses);
  }

  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
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
        future: handler.retrieveExpenses(),
        builder: (BuildContext context, AsyncSnapshot<List<Expense>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(snapshot.data![index].description),
                    subtitle: Text(snapshot.data![index].amount.toString()),
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
