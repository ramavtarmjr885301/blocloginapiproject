import 'package:blocloginapiproject/BLoC/auth_Bloc/auth_event.dart';
import 'package:blocloginapiproject/BLoC/auth_Bloc/auth_state.dart';
import 'package:blocloginapiproject/Repos/login_repo.dart';
import 'package:blocloginapiproject/routes/routes_names.dart';
import 'package:blocloginapiproject/utils/states.dart';
import 'package:blocloginapiproject/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthBloc extends Bloc<AuthEvent, Authstate>{
//   final LoginRepo _loginRepo=LoginRepo();
//   AuthBloc():super(const Authstate()){
//     on<LoginReqEvent>(_login);
//   }
//   _login(LoginReqEvent event, Emitter<Authstate>emit)async{
//     emit(state.copyWith(loginStatus: ))
//   }
// }

class AuthBloc extends Bloc<AuthEvent, Authstate> {
  final LoginRepo _loginRepo = LoginRepo();
  AuthBloc() : super(const Authstate()) {
    on<LoginReqEvent>(_login);
  }

  _login(LoginReqEvent event, Emitter<Authstate> emit) async {
    emit(state.copyWith(loginStatus: ApiStatus.loadingState));
    await _loginRepo.login(event.userName, event.password).then((value) {
      print(value.email);

      emit(state.copyWith(loginStatus: ApiStatus.successState));
      return Navigator.pushNamed(event.context,RoutesNames.homeScreen);
    }).onError((error, stackTrace) {
      print(error);
      emit(state.copyWith(loginStatus: ApiStatus.errorState));
    });
  }

 
}

