import 'package:curso_flutter_cad_simple/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget{
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blue,
                onPressed: (){},
            ),
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}