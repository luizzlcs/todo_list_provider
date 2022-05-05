import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/core/database/sqlite_adm_connection.dart';
import 'package:todo_list_provider/core/ui/todo_list_ui_config.dart';
import 'package:todo_list_provider/models/auth/auth_module.dart';
import 'package:todo_list_provider/models/auth/login/login_controller.dart';
import 'package:todo_list_provider/models/auth/login/login_page.dart';
import '../models/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();
  @override
  void initState() {
    super.initState();
    //Controlando o boserver da nossa página
    WidgetsBinding.instance?.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Para não ter uma duplicação de de código das rotas
    // Vamos estruturar uma arquiterura baseada em módulos
    // Pra isso foi criado a classe authModule().
    return MaterialApp(
      title: 'Todo Lis Provider',
      initialRoute: '/login',
      theme: TodoListUiConfig.theme,
      routes: {
        // Importado toda a estrutura criada no auth_module.
        ...authModule().routers,
      },
      home: const SplashPage(),
    );
  }
}
