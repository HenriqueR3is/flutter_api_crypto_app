class CryptoCurrency {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double? changePercent24h;

  CryptoCurrency({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    this.changePercent24h,
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    final usdQuote = json['quote']?['USD'];

    return CryptoCurrency(
      id: json['id']?.toString() ?? '',
      name: json['name'],
      symbol: json['symbol'],
      priceUsd: (usdQuote != null && usdQuote['price'] != null)
          ? (usdQuote['price'] as num).toDouble()
          : 0.0,
      changePercent24h: (usdQuote != null && usdQuote['percent_change_24h'] != null)
          ? (usdQuote['percent_change_24h'] as num).toDouble()
          : null,
    );
  }
}
