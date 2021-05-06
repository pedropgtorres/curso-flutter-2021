import 'package:curso_flutter_cad_simple/models/user.dart';
import 'package:curso_flutter_cad_simple/provider/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget{

  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final isNameValid = _form.currentState.validate();
              final isEmailValid = _form.currentState.validate();

              if(isNameValid && isEmailValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  avatarUrl: _formData['avatarUrl']
                ));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Preencha o nome';
                  }

                  if(value.trim().length < 3){
                    return 'Nome muito curto';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                   return 'Preencha o email';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Url Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}