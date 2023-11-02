import 'package:flutter/material.dart';
import 'package:todo_list_laos/app/core/Ui/theme_extensions.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 200),
          Text(
            'Todo List',
            style: context.texttheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
