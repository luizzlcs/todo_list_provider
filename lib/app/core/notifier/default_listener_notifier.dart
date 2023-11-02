import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todo_list_laos/app/core/Ui/messages.dart';
import 'package:todo_list_laos/app/core/notifier/default_change_notifier.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier changeNotifier;

  DefaultListenerNotifier({
    required this.changeNotifier,
  });

  void listener({
    required BuildContext context,
    required SuccessVoidCallBack successCallBack,
    ErrorVoidCallBack? errorCallBack,
  }) {
    changeNotifier.addListener(() {
      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        if (errorCallBack != null) {
          errorCallBack(changeNotifier, this);
        }
        Messages.of(context).showError(changeNotifier.error ?? 'Erro interno');
      } else if (changeNotifier.isSuccess) {
        successCallBack(changeNotifier, this);
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SuccessVoidCallBack = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerInstace);
typedef ErrorVoidCallBack = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerInstace);
