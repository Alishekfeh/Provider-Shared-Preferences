class CardModel {
  final int id, available;
  final String name, bankName, number, currency;

  CardModel(
      { this.id = 0, required this.available, required this.name, this.bankName = "", required this.number,
        required this.currency});


  Map toJson() =>
      {
        'id': id,
        'available': available,
        'name': name,
        'bankName': bankName,
        'number': number,
        'currency': currency,
      };

  CardModel.fromJson(Map json)
      :
        name=json['name'],
        available=json['available'],
        id=json['id'],
        bankName=json['bankName'],
        number=json['number'],
        currency=json['currency'];
}