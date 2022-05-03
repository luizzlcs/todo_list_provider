import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/models/auth/login/login_controller.dart';
import 'package:todo_list_provider/models/auth/login/login_page.dart';
import '../models/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Lis Provider',
      routes: {
        '/login': (context) => MultiProvider(
              providers: [
                Provider(
                  create: (_) => 'Repository',
                ),
                Provider(
                  create: (_) => 'Service',
                ),
                ChangeNotifierProvider(create: (_) => LoginController()),
              ],
              child: LoginPage(),
            ),
        '/register': (context) => MultiProvider(
              providers: [
                Provider(
                  create: (_) => 'Repository',
                ),
                Provider(
                  create: (_) => 'Service',
                ),
                ChangeNotifierProvider(create: (_) => LoginController()),
              ],
              child: LoginPage(),
            ),
      },
      home: SplashPage(),
    );
  }
}
