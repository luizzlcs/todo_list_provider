import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_laos/app/repositories/user/user_repository.dart';
import 'package:todo_list_laos/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_laos/app/services/user/user_service.dart';
import 'package:todo_list_laos/app/services/user/user_service_impl.dart';

import 'app_widget.dart';
import 'core/database/sqlite_connetion_factory.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(
          create: (_) => SqliteConnetionFactory(),
          lazy: false,
        ),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(firebaseAuth: context.read()),
        ),
        Provider<UserService>(
          create: (context) => UserServiceImpl(userRepository: context.read()),
        )
      ],
      child: const AppWidget(),
    );
  }
}
