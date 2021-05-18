import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';
import 'package:quiz/resultado.dart';

/*
    Objetivo: Criar um app que simule um quiz.
    Autor: Paulo Torres
    Data: 08/03/2021
*/

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget{
  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }

}

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada=0;
  var _pontuacaoTotal=0;

  final List<Map <String,Object>> _perguntas = const [
    {
      'pergunta':'Qual é a sua cor favorita?',
      'resposta':[
        {'texto': 'Preto', 'pontos': 10},
        {'texto': 'Vermelho', 'pontos': 1},
        {'texto': 'Verde', 'pontos': 3},
        {'texto': 'Branco', 'pontos': 5}
        ]
    },
    {
      'pergunta':'Qual é a seu animal favorito?',
      'resposta':[
        {'texto': 'Coelho', 'pontos': 3},
        {'texto': 'Cobra', 'pontos': 1},
        {'texto': 'Elefante', 'pontos': 5},
        {'texto': 'Leão', 'pontos': 10}
        ]
    },
    {
      'pergunta':'Qual seu instrutor favorito?',
      'resposta':[
        {'texto': 'Maria', 'pontos': 1},
        {'texto': 'João', 'pontos': 3},
        {'texto': 'Leo', 'pontos': 5},
        {'texto': 'Pedro', 'pontos': 10}
        ]
    }
  ];

  bool get temPergSelect{
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPergSelect) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _refresh(){
    setState((){
      _perguntaSelecionada=0;
      _pontuacaoTotal=0;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String,Object>> respostas = temPergSelect ? _perguntas[_perguntaSelecionada]['resposta'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz",
          textAlign: TextAlign.center),
        ),
        body: temPergSelect
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
        )
            : Resultado(_pontuacaoTotal, _refresh)
      ),
    );
  }
}

