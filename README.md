# 📱 Crypto App

Aplicativo Flutter que consome a API da CoinMarketCap para exibir informações de criptomoedas. Projeto desenvolvido como trabalho prático para a disciplina de Programação para Dispositivos Móveis.

## ✅ Funcionalidades implementadas

1. **Listagem de Criptomoedas**: Exibe uma lista com nome, símbolo, preço e variação percentual nas últimas 24h das principais moedas, além do preço em tempo real.
2. **Detalhes da Moeda**: Ao tocar em uma moeda da lista, o app navega para uma tela com o nome completo, símbolo, preço e uma descrição personalizada sobre a moeda. As descrições são escritas manualmente para fornecer um breve histórico e informações relevantes.
3. **Atualização com Pull-to-Refresh**: Na tela inicial, o usuário pode puxar os dados mais recentes ao deslizar para baixo.
4. **Pesquisa**: Filtro por nome ou símbolo da cripto (ex: BTC, ETH).
5. **Estrutura MVVM**: Separação clara entre modelo, visualização e lógica.
6. **Provider + ValueNotifier**: Gerenciamento de estado limpo e eficiente.
7. **Consumo de API externa**: Integração com a CoinMarketCap usando HTTP e parsing JSON.

## 💻 Tecnologias utilizadas
- Flutter
- Dart
- Android Studio
- MVVM architecture com ChangeNotifier
- Provider
- HTTP
- CoinMarketCap API

## 📁 Estrutura de pastas
flutter_projects/
|---- lib/
| |---- models/
| |---- repositories/
| |---- screens/
| |---- services/
| |---- view_models/
| |---- views/
|---- main.dart

## 🔧 Como rodar o projeto

1. Clone o repositório:

'''bash
git clone <github.com/HenriqueR3is/flutter_api_crypto_app>

2. Acesse o diretório:

cd flutter_projects

3. Instale as dependências:

flutter pub get

4. Execute o app:

flutter run

5. Use r ou R no terminal para hot reload e hot restart, muito úteis durante o desenvolvimento.

## 📌 Observações

1. A API da CoinMarketCap exige chave de autenticação.

2. Algumas funcionalidades podem ser expandidas futuramente, como favoritos e gráficos.

## 👨‍💻 Autor
## Henrique Hiroshi Koshiba R3is --- @Henrique

