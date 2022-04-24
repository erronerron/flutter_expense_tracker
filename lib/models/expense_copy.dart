class Expense {
  late final int id;
  late final int categoryId;
  late final String description;
  late final int amount;
  late final String paidAt;
  late final String createdAt;
  late final String updatedAt;

  Expense({
    required this.id,
    required this.categoryId,
    required this.description,
    required this.amount,
    required this.paidAt,
    required this.createdAt,
    required this.updatedAt,
  });

  Expense.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        categoryId = result["categoryId"],
        description = result["description"],
        amount = result["amount"],
        paidAt = result["paidAt"],
        createdAt = result["createdAt"],
        updatedAt = result["updatedAt"];
  Map<String, Object> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'description': description,
      'amount': amount,
      'paidAt': paidAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
