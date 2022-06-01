import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reset;
  Resultado({this.pontuacao, this.reset});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Você chegou ao fim!',
            style: TextStyle(fontSize: 33),
          ),
        ),
        Center(
          child: Text(
            'Sua pontuação foi $pontuacao',
            style: TextStyle(fontSize: 16.5),
          ),
        ),
        FlatButton(
          child: Text('Tentar novamente?'),
          textColor: Colors.blue,
          onPressed: reset,
        )
      ],
    );
  }
}
