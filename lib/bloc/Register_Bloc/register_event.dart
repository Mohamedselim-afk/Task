import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String username;
  final String password;

  RegisterSubmitted(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
