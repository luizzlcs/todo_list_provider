// Criando a adminsitração para controle
// para abrir e fecha a conexão do banco de dados.
// A proposta aqui é evitar que a conexão com o banco
// continue aberta e o app seja interrompido
// abrubtamente pelo usuário corrompendo o banco.

import 'package:flutter/material.dart';
import 'package:todo_list_provider/core/database/sqlite_conection_factory.dart';

// WidgetsBindingObserver: Irá observar o flutter como um todo
class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  // Esse método irá nos dar a possibilidade de
  // ver o que o usuário fez dentro da aplicação.
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //Pegando a instância de conexão com o banco
    final connection = SqliteConectionFactory();

    switch (state) {
      // Ações do usuário
      case AppLifecycleState.resumed:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        // Se o usuário fizer uma das três ações,
        // eu quero que feche a conexão com o banco de dados.
        connection.closeConnection();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
