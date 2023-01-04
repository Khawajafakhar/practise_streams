import 'package:flutter/foundation.dart' show immutable;
import 'package:practise_bloc/models.dart';

@immutable
class AppState {
  final bool isloading;
  final LoginErrors? loginError;
  final LoginHandle? loginHandle;
  final Iterable<Notes>? fetchedNotes;

  const AppState.empty()
      : isloading = false,
        loginError = null,
        loginHandle = null,
        fetchedNotes = null;

  const AppState({
    required this.isloading,
    required this.loginError,
    required this.loginHandle,
    required this.fetchedNotes,
  });
}
