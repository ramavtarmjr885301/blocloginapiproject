import 'package:blocloginapiproject/BLoC/model/loginReqModel.dart';
import 'package:blocloginapiproject/BLoC/model/loginResponseModel.dart';
import 'package:equatable/equatable.dart';

abstract class Authstate extends Equatable {}

class LoginState extends Authstate {
  @override
  List<Object?> get props => [];
}
class LoginInitialState extends Authstate {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends Authstate {
  @override
  List<Object?> get props => [];
}


class LoginSuccessState extends Authstate {
  LoginResponseModel? loginResponseModel;
  LoginSuccessState({required this.loginResponseModel,});
  List<Object?> get props => [loginResponseModel];
}

class LoginErrorState extends Authstate {
  String? errorMessage;
  LoginErrorState({required this.errorMessage});
  List<Object?> get props => [errorMessage];
}
