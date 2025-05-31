import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoApiService {
  final String _baseUrl = 'https://pro-api.coinmarketcap.com/v1';
  static const String _apiKey = '3e6f0f9a-3cac-41bd-861d-0459108b2e9a';

  Future<Map<String, dynamic>> fetchCryptoData(List<String> symbols) async {
    final url = Uri.parse(
      '$_baseUrl/cryptocurrency/quotes/latest?symbol=${symbols.join(",")}',
    );

    final response = await http.get(
      url,
      headers: {
        'X-CMC_PRO_API_KEY': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao buscar dados: ${response.body}');
    }
  }
}
