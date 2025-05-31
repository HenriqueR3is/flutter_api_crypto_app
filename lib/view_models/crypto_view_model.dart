import 'package:flutter/material.dart';
import '../models/crypto_currency.dart';
import '../repositories/crypto_repository.dart';

enum CryptoState { idle, loading, loaded, error }

class CryptoViewModel extends ChangeNotifier {
  CryptoRepository _repository;
  ValueNotifier<List<CryptoCurrency>> cryptos = ValueNotifier([]);

  CryptoViewModel(this._repository);

  set repository(CryptoRepository repository) {
    _repository = repository;
  }

  Future<void> fetchCryptos(List<String> symbols) async {
    try {
      final result = await _repository.fetchCryptos(symbols);
      cryptos.value = result;
    } catch (e) {
      print('Erro ao buscar criptos: $e');
    }
  }

  notifyListeners();

  Future<void> loadCryptos() async {
    await fetchCryptos(['BTC', 'ETH', 'XRP', 'ADA', 'DOGE']);
  }
}