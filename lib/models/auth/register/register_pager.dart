import 'package:flutter/material.dart';
import 'package:todo_list_provider/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/core/wdget/todo_list_field.dart';
import 'package:todo_list_provider/core/wdget/todo_list_logo.dart';

class RegisterPager extends StatelessWidget {
  const RegisterPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'TodoList',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ]),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            // Fittedbox Utilizado para ajustar proporcionalmente a imagem a tela.
            child: FittedBox(
              child: TodoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
              child: Column(
                children: [
                  TodoListField(label: 'E-mail'),
                  const SizedBox(height: 20),
                  TodoListField(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TodoListField(label: 'Confirmar Senha', obscureText: true),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Salvar'),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
