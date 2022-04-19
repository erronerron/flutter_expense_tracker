import 'package:flutter/material.dart';

class Test {
  final String description;
  final int amount;

  Test({required this.description, required this.amount});
}

// A list of tests
final List<Test> initialData = [
  Test(description: "Test 1", amount: 80),
  Test(description: "Test 2", amount: 50),
  Test(description: "Test 3", amount: 100),
];

class TestProvider with ChangeNotifier {
  // Retrieve all tests
  List<Test> get tests => initialData;

  // Tests
  final List<Test> _myList = initialData;

  // Retrieve tests
  List<Test> get myList => _myList;

  // Adding a test to the list
  void addToList(Test test) {
    _myList.add(test);
    notifyListeners();
  }

  // Removing a test from the list
  void removeFromList(Test test) {
    _myList.remove(test);
    notifyListeners();
  }
}
