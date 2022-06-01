import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() aoSelecionar;

  Resposta(this.texto, this.aoSelecionar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(texto),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: aoSelecionar,
      ),
    );
  }
}
