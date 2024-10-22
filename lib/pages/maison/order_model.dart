class OrderModel {
  final String id;
  final String productName;
  final double price;
  final String status; // En traitement, Livré, etc.
  final DateTime orderDate;

  OrderModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.status,
    required this.orderDate,
  });
}
