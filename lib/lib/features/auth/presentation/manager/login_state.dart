part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String liveKitUrl;
  final String token;

  const LoginSuccess(this.liveKitUrl, this.token);

  @override
  List<Object> get props => [liveKitUrl, token];
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}
