import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final List<Map<String, Object>> respostas;
  final void Function(int) responder;

  const Questionario(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.respostas,
      @required this.responder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas
            .map((resp) =>
                Resposta(resp['texto'], () => responder(resp['pontuacao'])))
            .toList(),
      ],
    );
  }
}
