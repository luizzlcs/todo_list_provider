import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/services/app_widget.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Object(),
        )
      ],
      child: AppWidget(),
    );
  }
}
