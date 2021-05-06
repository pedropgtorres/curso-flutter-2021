import 'dart:math';
import 'package:curso_flutter_cad_simple/data/dummy_users.dart';
import 'package:curso_flutter_cad_simple/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all{
    return[..._items.values];
  }

  int get count{
    return _items.length;
  }
  
  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user){
    if(user == null){
      return;
    }

    if(user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)){
      // update user
      _items.update(user.id, (_) => user);
    } else{
      // add User
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl
      ));
    }
    notifyListeners();
  }

  void remove(User user){
    if(user != null && user.id != null){
     // delete user
      _items.remove(user.id);
      notifyListeners();
    }
  }
}