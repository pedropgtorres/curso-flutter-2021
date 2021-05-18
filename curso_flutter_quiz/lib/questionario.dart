import 'package:flutter/material.dart';
import 'package:quiz/questao.dart';
import 'package:quiz/resposta.dart';

/*
    Objetivo: Criar classe para exibir o questionario, encapsulando perguntas e respostas.
    Autor: Paulo Torres
    Data: 22/03/2021
*/


class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
});

  bool get temPergSelect{
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String,Object>> respostas = temPergSelect ? perguntas[perguntaSelecionada]['resposta'] : null;

    return Column(
      children: <Widget> [
        Questao(perguntas[perguntaSelecionada]['pergunta']),
        ...respostas.map((resp) {
          return Resposta(resp['texto'], () => responder(resp['pontos']));
          }).toList(),
      ],
    );
  }
}
