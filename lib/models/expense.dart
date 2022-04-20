class Expense {
  late final int id;
  late final String description;
  late final int amount;

  Expense({
    required this.id,
    required this.description,
    required this.amount,
  });

  Expense.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        description = result["description"],
        amount = result["amount"];
  Map<String, Object> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
    };
  }
}
