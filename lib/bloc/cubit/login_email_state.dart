part of 'login_email_cubit.dart';

class LoginEmailState extends Equatable {
  final Result<Login>? users;
  final Result<Login>? userSP;
  const LoginEmailState({
    this.users,
    this.userSP,
  });

  LoginEmailState copyWith({
    Result<Login>? users,
    Result<Login>? userSP,
  }) {
    return LoginEmailState(
      users: users ?? this.users,
      userSP: userSP ?? this.userSP,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        users,
        userSP,
      ];
}
