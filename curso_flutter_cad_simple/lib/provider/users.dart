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
}