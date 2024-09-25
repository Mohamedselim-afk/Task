import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsk/Repository/repository.dart';
import 'register_event.dart';
import 'register_state.dart';



class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoginRepository registerRepository;

  RegisterBloc(this.registerRepository) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
      RegisterSubmitted event,
      Emitter<RegisterState> emit,
      ) async {
    emit(RegisterLoading());
    try {
      final response = await registerRepository.register(event.username, event.password);
      if (response.statusCode == 200) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure('Registration failed. Please try again.'));
      }
    } catch (error) {
      emit(RegisterFailure('An error occurred: ${error.toString()}'));
    }
  }
}
