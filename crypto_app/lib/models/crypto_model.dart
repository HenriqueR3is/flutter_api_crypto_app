class CryptoModel {
  final int id;
  final String name;
  final String symbol;
  final double price;
  final double change24h;

  CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change24h,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    final quote = json['quote']['USD'];
    return CryptoModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      price: (quote['price'] as num).toDouble(),
      change24h: (quote['percent_change_24h'] as num).toDouble(),
    );
  }
}
