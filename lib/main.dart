import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/crypto_list_screen.dart';
import 'view_models/crypto_view_model.dart';
import 'repositories/crypto_repository.dart';
import 'services/crypto_api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => CryptoApiService()),
        ProxyProvider<CryptoApiService, CryptoRepository>(
          update: (_, api, __) => CryptoRepository(api),
        ),
        ChangeNotifierProxyProvider<CryptoRepository, CryptoViewModel>(
          create: (context) => CryptoViewModel(context.read<CryptoRepository>()),
          update: (_, repo, vm) => vm!..repository = repo,
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto App',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
        ),
        home: const CryptoListScreen(),
      ),
    );
  }
}
