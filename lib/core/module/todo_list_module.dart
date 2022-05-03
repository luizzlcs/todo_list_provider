import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class TodoListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  // O construtores não podem começar com underline, não pode ser privado
  // por isso foi usado a extratégia de atribuição
  // para que ninguém de fora tenha acesso aos bindigs.
  TodoListModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return {};
  }
}
