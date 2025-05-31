import 'package:flutter/material.dart';
import '../models/crypto_currency.dart';

class CryptoDetailScreen extends StatelessWidget {
  final CryptoCurrency crypto;

  const CryptoDetailScreen({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${crypto.name} Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${crypto.name} (${crypto.symbol})', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text('Preço: \$${crypto.priceUsd.toStringAsFixed(2)}'),
            Text('Variação (24h): ${crypto.changePercent24h?.toStringAsFixed(2) ?? "N/A"}%'),
            const SizedBox(height: 24),
            const Text('Descrição:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Criptomoeda popular usada para troca digital descentralizada.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
