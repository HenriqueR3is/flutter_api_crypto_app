import '../models/crypto_currency.dart';
import '../services/crypto_api_service.dart';

class CryptoRepository {
  final CryptoApiService _apiService;

  CryptoRepository(this._apiService);

  Future<List<CryptoCurrency>> fetchCryptos(List<String> symbols) async {
    final Map<String, dynamic> json = await _apiService.fetchCryptoData(symbols);

    final data = json['data'] as Map<String, dynamic>;
    List<CryptoCurrency> cryptos = [];

    data.forEach((key, value) {
      try {
        final crypto = CryptoCurrency.fromJson(value);
        print('✔️  ${crypto.symbol}: \$${crypto.priceUsd}');
        cryptos.add(crypto);
      } catch (e) {
        print('Erro ao converter $key: $e');
      }
    });


    return cryptos;
  }
}
