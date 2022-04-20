import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/expense.dart';

class DataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'expenses.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE expenses(id INTEGER PRIMARY KEY , description TEXT NOT NULL,amount INTEGER NOT NULL)",
        );
      },
    );
  }

  // insert data
  Future<int> insertExpenses(List<Expense> expenses) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var expense in expenses) {
      result = await db.insert('expenses', expense.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

  // retrieve data
  Future<List<Expense>> retrieveExpenses() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('expenses');
    return queryResult.map((e) => Expense.fromMap(e)).toList();
  }

  // delete user
  Future<void> deleteExpense(int id) async {
    final db = await initializedDB();
    await db.delete(
      'expenses',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
