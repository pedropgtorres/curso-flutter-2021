import 'package:flutter/material.dart';

class TransactionGraphic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Text('Gráfico'),
        color: Theme.of(context).primaryColor,
        elevation: 5,
      ),
    );
  }
}
