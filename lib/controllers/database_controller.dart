import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(path, 'expenses.db'),
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
      // When the database is first created, create a table to store records.
      onCreate: (Database db, int version) async {
        // Run the CREATE TABLE statements on the database.
        await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, email TEXT NOT NULL, currency TEXT, icon TEXT, createdAt TEXT NOT NULL, updatedAt TEXT NOT NULL)",
        );
        await db.execute(
          "CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT NOT NULL, icon TEXT, createdAt TEXT NOT NULL, updatedAt TEXT NOT NULL)",
        );
        await db.execute(
          "CREATE TABLE expenses(id INTEGER PRIMARY KEY, description TEXT NOT NULL, amount INTEGER NOT NULL, paidAt TEXT NOT NULL, createdAt TEXT NOT NULL, updatedAt TEXT NOT NULL, categoryId INTEGER NOT NULL, FOREIGN KEY(categoryId) REFERENCES categories(id))",
        );
        await db.execute(
          "CREATE TABLE incomes(id INTEGER PRIMARY KEY, description TEXT NOT NULL, amount INTEGER NOT NULL, date TEXT NOT NULL, createdAt TEXT NOT NULL, updatedAt TEXT NOT NULL)",
        );
        await db.execute(
          "CREATE TABLE spending_limits(id INTEGER PRIMARY KEY, amount INTEGER NOT NULL, startDate TEXT NOT NULL, endDate TEXT NOT NULL, createdAt TEXT NOT NULL, updatedAt TEXT NOT NULL)",
        );
        await db.execute(
          "CREATE TABLE transactions(id INTEGER PRIMARY KEY, transactionId INTEGER NOT NULL, transactionType TEXT NOT NULL, createdAt TEXT NOT NULL, updatedAt TEXT NOT NULL)",
        );
        await db.execute(
          "INSERT INTO categories(name, icon, createdAt, updatedAt) VALUES ('Food', '', '${DateTime.now().toString()}', '${DateTime.now().toString()}'), ('Electricity', '', '${DateTime.now().toString()}', '${DateTime.now().toString()}'), ('Water', '', '${DateTime.now().toString()}', '${DateTime.now().toString()}')",
        );
      },
    );
  }
}
