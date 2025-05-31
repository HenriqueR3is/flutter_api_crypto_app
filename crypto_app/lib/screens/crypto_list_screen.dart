import 'package:crypto_app/views/crypto_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/crypto_currency.dart';
import '../view_models/crypto_view_model.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final vm = context.read<CryptoViewModel>();
      vm.fetchCryptos(['BTC', 'ETH', 'XRP', 'ADA', 'DOGE']);
    });
  }

  void _onSearch() {
    final text = _searchController.text.trim();
    if (text.isEmpty) return;

    final symbols = text.split(',').map((e) => e.trim().toUpperCase()).toList();

    final vm = context.read<CryptoViewModel>();
    vm.fetchCryptos(symbols);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CryptoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Prices'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Pesquisar por símbolos (ex: BTC,ETH,XRP)',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ),
              onSubmitted: (_) => _onSearch(),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await viewModel.loadCryptos();
              },
              child: ValueListenableBuilder<List<CryptoCurrency>>(
                valueListenable: viewModel.cryptos,
                builder: (context, cryptoList, _) {
                  if (cryptoList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: cryptoList.length,
                    itemBuilder: (context, index) {
                      final crypto = cryptoList[index];
                      return ListTile(
                        title: Text('${crypto.name} (${crypto.symbol})'),
                        subtitle: Text('\$${crypto.priceUsd.toStringAsFixed(2)}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CryptoDetailScreen(crypto: crypto),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}