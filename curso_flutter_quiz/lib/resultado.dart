import 'package:flutter/material.dart';

/*
    Objetivo: Criar classe para exibir o resultado.
    Autor: Paulo Torres
    Data: 22/03/2021
*/


class Resultado extends StatelessWidget{

  final int pontuacao;
  final void Function() onRefresh;

  Resultado(this.pontuacao, this.onRefresh);

  String get fraseResultado{
    if(pontuacao < 8){
      return 'Parabéns!';
    } else if(pontuacao < 12){
      return 'Você é bom!';
    } else if(pontuacao < 16){
      return 'Impressionante';
    } else{
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
            Center(
            child: Text(fraseResultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
          ),
          ElevatedButton(
              onPressed: onRefresh,
              child: Text('Reiniciar?'))
        ]
    );
  }
}