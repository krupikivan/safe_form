import 'package:flutter/material.dart';
import 'package:safe_form/utilities/notifier_state.dart';

class BaseViewModel extends ChangeNotifier {
  NotifierState _notifierState = NotifierState.initial;

  NotifierState get notifierState => _notifierState;

  void setNotifierState(NotifierState viewState) {
    _notifierState = viewState;
    notifyListeners();
  }
}
