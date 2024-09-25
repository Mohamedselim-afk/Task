import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk/Repository/repository.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<CheckLoginStatus>(_onCheckLoginStatus);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoading());
    try {
      final response = await loginRepository.login(event.username, event.password);
      if (response.statusCode == 200) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Login failed. Please check your credentials.'));
      }
    } catch (error) {
      emit(LoginFailure('An error occurred: ${error.toString()}'));
    }
  }

  Future<void> _onCheckLoginStatus(
      CheckLoginStatus event,
      Emitter<LoginState> emit,
      ) async {
    final isLoggedIn = await loginRepository.isLoggedIn();
    if (isLoggedIn) {
      emit(LoginSuccess());
    } else {
      emit(LoginInitial());
    }
  }
}
