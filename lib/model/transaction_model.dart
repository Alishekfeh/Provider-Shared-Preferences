class TransactionModel {
  int id;
  String name, price, type,currency;

  TransactionModel(
      { this.id=0,
      required this.name,
      required this.price,
      required this.currency,
      required this.type});
}
