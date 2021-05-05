import 'package:curso_flutter_cad_simple/data/dummy_users.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_cad_simple/components/user_tile.dart';

class UserList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){},
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      ),
    );
  }
}