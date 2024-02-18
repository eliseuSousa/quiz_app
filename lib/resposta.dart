import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() quandoSelecionado;
  Resposta(this.resposta, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 12),
      width: double.infinity,
      child: (ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
        ),
        onPressed: quandoSelecionado,
        child: Text(
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          resposta,
        ),
      )),
    );
  }
}
