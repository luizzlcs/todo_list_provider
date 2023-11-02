import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'core/Ui/todo_list_ui_config.dart';
import 'core/auth/auth_module.dart';
import 'core/database/sqlite_adm_connetion.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnetion = SqliteAdmConnetion();

  @override
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    WidgetsBinding.instance.addObserver(sqliteAdmConnetion);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnetion);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list provider',
      initialRoute: '/login',
      theme: TodoListUiConfig.theme,
      routes: {
        ...AuthModule().routers,
      },
      home: const SplashPage(),
    );
  }
}
