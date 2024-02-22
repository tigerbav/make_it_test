part of 'login_cubit.dart';

enum LoginStatus { initial, idle, success, failure }

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    this.stringTime = 'XX:XX',
    this.errorMessage,
  });

  final LoginStatus status;
  //TODO: bad solution
  final String stringTime;
  final String? errorMessage;

  bool get containX => stringTime.contains('X');

  LoginState copyWith({
    required LoginStatus status,
    String? stringTime,
    String? errorMessage,
  }) {
    return LoginState(
      status: status,
      stringTime: stringTime ?? this.stringTime,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        stringTime,
        errorMessage,
      ];
}
