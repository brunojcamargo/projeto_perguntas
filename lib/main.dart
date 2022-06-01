import 'package:flutter/material.dart';
import './resultado.dart';
import 'questionario.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontucaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Branco', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Preto', 'pontuacao': 6}
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Cavalo', 'pontuacao': 14},
        {'texto': 'Elefante', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 13},
        {'texto': 'Tigre', 'pontuacao': 5}
      ],
    },
    {
      'texto': 'Quanto é 1+1 ?',
      'respostas': [
        {'texto': '2', 'pontuacao': 0},
        {'texto': '11', 'pontuacao': 5},
        {'texto': '99', 'pontuacao': 5},
        {'texto': '16', 'pontuacao': 2}
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontucaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestinario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontucaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Opção 1
    // List<Widget> respostas = [];
    // for (String textoResposta in perguntas[_perguntaSelecionada]['respostas']) {
    //   respostas.add(Resposta(textoResposta, _responder));
    // }
    // Opção2
    List<Map<String, Object>> _respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : [];
    //List<Widget> widgets;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  respostas: _respostas,
                  responder: _responder)
              : Resultado(
                  pontuacao: _pontucaoTotal,
                  reset: _reiniciarQuestinario,
                )),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
