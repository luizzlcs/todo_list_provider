import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/models/auth/auth_module.dart';
import 'package:todo_list_provider/models/auth/login/login_controller.dart';
import 'package:todo_list_provider/models/auth/login/login_page.dart';
import '../models/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Lis Provider',
      initialRoute: '/login',
      routes: {
        // Importado toda a estrutura criada no auth_module.
        ...authModule().routers,
      },
      home: const SplashPage(),
    );
  }
}
