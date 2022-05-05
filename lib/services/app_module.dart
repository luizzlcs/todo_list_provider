import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/core/database/sqlite_conection_factory.dart';
import 'package:todo_list_provider/services/app_widget.dart';

// Criando a conexaão das migration com o provider.
class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SqliteConectionFactory(),
          // Ao cair no Laize instancia a classe e faz toda a estrutura de
          // migration deixando a conexão deisponível para ser utilizada.
          lazy: false,
          // O padrão do lazy é true, foi passado false para que as 
          // a mirgration já sejam criadas na primeira inicialização.
        )
      ],
      child: AppWidget(),
    );
  }
}
