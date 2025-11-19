class LiqPayItem {
  /// Unique identifier of the item in your shop.
  final int id;

  /// Quantity of the item.
  final int amount;

  /// Total cost for the item (amount * price).
  final double cost;

  /// Price of a single item.
  final double price;

  LiqPayItem({
    required this.id,
    required this.amount,
    required this.cost,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'amount': amount, 'cost': cost, 'price': price};
  }

  factory LiqPayItem.fromJson(Map<String, dynamic> json) {
    return LiqPayItem(
      id: json['id'] as int,
      amount: json['amount'] as int,
      cost: (json['cost'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );
  }
}
