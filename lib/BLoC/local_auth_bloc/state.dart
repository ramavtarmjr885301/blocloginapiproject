import 'package:bloc_practice/barrel.dart';


class LocalState extends Equatable {
  final ApiStatus loginStatus;
  final String? username;
  final String? mobilenumber;
  final String? email;
  final String? password;
  const LocalState(
      {this.loginStatus = ApiStatus.initialState,
      this.username,
      this.mobilenumber,
      this.email,
      this.password});
  LocalState copyWith(
      {ApiStatus? loginStatus,
      String? username,
      String? mobilenumber,
      String? email,
      String? password}) {
    return LocalState(
        loginStatus: loginStatus ?? this.loginStatus,
        username: username ?? this.username,
        mobilenumber: mobilenumber ?? this.mobilenumber,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [loginStatus,username,mobilenumber,email,password];
}
