import 'package:flutter/material.dart';
import 'package:todo_list_laos/app/core/database/sqlite_connetion_factory.dart';

class SqliteAdmConnetion with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connection = SqliteConnetionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        // TODO: Handle this case.
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        connection.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
