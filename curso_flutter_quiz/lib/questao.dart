import 'package:flutter/material.dart';

/*
    Objetivo: Criar classe para as perguntas.
    Autor: Paulo Torres
    Data: 18/03/2021
*/

class Questao extends StatelessWidget{
  final String texto;
  
  Questao(this.texto);
  
  @override
  Widget build(BuildContext context){
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Text(
          texto,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center
        ),
    );
  }
}