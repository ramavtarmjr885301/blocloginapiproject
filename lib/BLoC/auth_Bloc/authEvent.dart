import 'package:blocloginapiproject/BLoC/model/loginReqModel.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {

}

class LoginReqEvent extends AuthEvent {
  LoginReqModel? loginReqModel;
  LoginReqEvent({required this.loginReqModel});

  @override
  List<Object?> get props => [loginReqModel];
}
