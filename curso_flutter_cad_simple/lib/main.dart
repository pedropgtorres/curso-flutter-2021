import 'package:curso_flutter_cad_simple/routes/app_routes.dart';
import 'package:curso_flutter_cad_simple/views/user-form.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_cad_simple/views/user_list.dart';
import 'package:curso_flutter_cad_simple/provider/users.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Users(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            AppRoutes.HOME: (_) => UserList(),
            AppRoutes.LIST_FORM: (_) => UserForm()
          },
        ));
  }
}
