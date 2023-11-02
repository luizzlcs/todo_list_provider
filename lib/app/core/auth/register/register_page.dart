import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_laos/app/core/Ui/theme_extensions.dart';
import 'package:todo_list_laos/app/core/auth/register/register_controller.dart';
import 'package:todo_list_laos/app/core/notifier/default_listener_notifier.dart';
import 'package:validatorless/validatorless.dart';
import '../../widget/todo_list_field.dart';
import '../../widget/todo_list_logo.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final defaultListener = DefaultListenerNotifier(
        changeNotifier: context.read<RegisterController>());
    defaultListener.listener(
      context: context,
      successCallBack: (notifier, listenerInstace) {
        listenerInstace.dispose();
        Navigator.of(context).pop();
      },
      // Esse atributo é opcional.
      // errorCallBack: (notifier, listenerInstace) {
      //   debugPrint('DEU RUIN!!!');
      // },
    );

    // context.read<RegisterController>().addListener(() {
    //   final controller = context.read<RegisterController>();
    //   var success = controller.success;
    //   var error = controller.error;
    //   if (success) {
    //     Navigator.of(context).pop();
    //   } else if (error != null && error.isNotEmpty) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(error),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 10, color: context.primaryColor),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 15, color: context.primaryColor),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(50),
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
          SizedBox(
            height: MediaQuery.of(context).size.width * .5,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: TodoListLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TodoListField(
                      controller: _emailEC,
                      label: 'email',
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail é obrigatório'),
                        Validatorless.email('E-mail inválido!')
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TodoListField(
                      controller: _passwordEC,
                      label: 'Senha',
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatória!'),
                        Validatorless.min(
                            6, 'Senha deve ter pelo menos seis caracteres.')
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TodoListField(
                        controller: _confirmPasswordEC,
                        label: 'Confirmar Senha',
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.compare(_passwordEC,
                              'Senha diferente de confirma senha.'),
                          Validatorless.required('Confirmar senha obrigatório.')
                        ])),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            final email = _emailEC.text;
                            final password = _passwordEC.text;
                            context
                                .read<RegisterController>()
                                .registerUser(email, password);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Salvar'),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
