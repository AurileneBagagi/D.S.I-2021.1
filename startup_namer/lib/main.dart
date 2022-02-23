import 'package:english_words/english_words.dart'; 
//pacote de código aberto chamado english_words, 
//que contém alguns milhares das palavras em inglês mais usadas, além de algumas funções utilitárias.
import 'package:flutter/material.dart';

// WIDGET'S=======================================================================================
// Um widget, numa interface gráfica, é um elemento de interação - tal como janelas, botões, menus, 
//ícones, barras de rolagem etc. O termo pode também se referir aos pequenos aplicativos que
// flutuam pela área de trabalho e fornecem funcionalidades específicas ao utilizador
//O trabalho principal de um widget é fornecer um método de construção que descreve como exibir o 
//widget em termos de outros widgets de nível inferior.

// STATELESS =====================================================================================
//Os widgets sem estado são imutáveis, o que significa que suas propriedades não podem ser 
//alteradas — todos os valores são finais.
//Os widgets com estado mantêm o estado que pode mudar durante a vida útil do widget. 
//A implementação de um widget stateful requer pelo menos duas classes, um StatefulWidget que cria 
//uma instância de uma classe State. O objeto StatefulWidget é, ele próprio,
//imutável e pode ser descartado e regenerado, mas o objeto State persiste durante a vida útil do widget.

void main() { // função que leva ao inicio do aplicativo
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override //sobrepor
  Widget build(BuildContext context) { //metodo construtor
    
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ), // modificação acrescentado pelo ALUNO
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key); // esssa constante não aparece no tutorial (por que?)

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  //Por padrão, o nome da classe State é prefixado com um sublinhado. Prefixar um identificador 
  //com um sublinhado reforça a privacidade na linguagem Dart e é uma prática recomendada 
  //para objetos State.
  final _suggestions = <WordPair>[];                 // NEW
  final _biggerFont = const TextStyle(fontSize: 18); // NEW
  @override

  Widget build(BuildContext context) {
    return Scaffold (                     // Add from here... 
      appBar: AppBar(
        title: const Text('Startup Name Generator. By: Aurilene Bagagi'), 
      ), // modificação EXTRA acrescentado pelo ALUNO
      body: _buildSuggestions(),
    );                                      // ... to here.
  }

  Widget _buildSuggestions() {
  return ListView.builder(
    padding: const EdgeInsets.all(16), // preenchimento
    //Para linhas ímpares, a função adiciona um
    // Widget divisor para separar visualmente as entradas. Observe que
    // o divisor pode ser difícil de ver em dispositivos menores.
    itemBuilder: (context, i) {
      // Adiciona um widget divisor de um pixel de altura antes de cada linha no ListView.
      if (i.isOdd) {
        return const Divider();
      }

      // A sintaxe "i ~/ 2" divide i por 2 e retorna um resultado inteiro.
      // Por exemplo: 1, 2, 3, 4, 5 se torna 0, 1, 1, 2, 2.
      // Isso calcula o número real de pares de palavras no ListView, menos os widgets divisores.
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
      //A função _buildSuggestions chama _buildRow uma vez por par de palavras. 
      //Essa função exibe cada novo par em um ListTile,
    },
  );
}

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  }
    
  

