import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaAtual = 0;
  var _pontuacaoTotal = 0;

  void _resposta(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaAtual++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaAtual = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': 'Qual a sua cor favorita?',
      'respostas': [
        {'opcao': 'Amarelo', 'pontuacao': 10},
        {'opcao': 'Azul', 'pontuacao': 5},
        {'opcao': 'Roxo', 'pontuacao': 3},
        {'opcao': 'Vermelho', 'pontuacao': 7}
      ],
    },
    {
      'pergunta': 'Qual sua casa em Harry Potter?',
      'respostas': [
        {'opcao': 'Grifinória', 'pontuacao': 10},
        {'opcao': 'Sonserina', 'pontuacao': 7},
        {'opcao': 'Corvinal', 'pontuacao': 5},
        {'opcao': 'Lufa-Lufa', 'pontuacao': 3},
      ],
    },
    {
      'pergunta': 'Qual a sua estação favorita do ano?',
      'respostas': [
        {'opcao': 'Verão', 'pontuacao': 10},
        {'opcao': 'Outono', 'pontuacao': 7},
        {'opcao': 'Inverno', 'pontuacao': 5},
        {'opcao': 'Primavera', 'pontuacao': 3}
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaAtual < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicativo de perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaAtual,
                quandoResponder: _resposta,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
