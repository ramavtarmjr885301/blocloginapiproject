import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginReqEvent extends AuthEvent {
final BuildContext context;
  final String userName;
  final String password;
  LoginReqEvent({required this.userName, required this.password,required this.context});
}
