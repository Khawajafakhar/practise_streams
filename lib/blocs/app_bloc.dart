import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise_bloc/api/login_api.dart';
import 'package:practise_bloc/api/notes_api.dart';
import 'package:practise_bloc/models.dart';
import './actions.dart';
import './states.dart';

class AppBloc extends Bloc<AppActions, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(const AppState.empty()) {
    on<LoginAction>((event, emit) async {
      emit(
        const AppState(
          isloading: true,
          loginError: null,
          loginHandle: null,
          fetchedNotes: null,
        ),
      );
      final fooBarHandle = await loginApi.login(
        email: event.email,
        password: event.password,
      );

      if (fooBarHandle == null) {
        emit(
          const AppState(
            isloading: false,
            loginError: LoginErrors.invalidHandle,
            loginHandle: null,
            fetchedNotes: null,
          ),
        );
      } else {
        emit(
          AppState(
            isloading: false,
            loginError: null,
            loginHandle: fooBarHandle,
            fetchedNotes: null,
          ),
        );
      }
    });

    on<LoadNotes>((event, emit) async {
      emit(
        AppState(
          isloading: true,
          loginError: null,
          loginHandle: state.loginHandle,
          fetchedNotes: null,
        ),
      );
      final loginHandle = state.loginHandle;
      if (loginHandle == const LoginHandle.fooBar()) {
        final notes = await notesApi.getNotes(
          loginHandle: loginHandle!,
        );
        emit(
          AppState(
            isloading: false,
            loginError: null,
            loginHandle: loginHandle,
            fetchedNotes: notes,
          ),
        );
      } else {
        emit(
          AppState(
            isloading: false,
            loginError: LoginErrors.invalidHandle,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );
      }
    });
  }
}
