

// class AuthBloc extends Bloc<AuthEvent, Authstate>{
//   final LoginRepo _loginRepo=LoginRepo();
//   AuthBloc():super(const Authstate()){
//     on<LoginReqEvent>(_login);
//   }
//   _login(LoginReqEvent event, Emitter<Authstate>emit)async{
//     emit(state.copyWith(loginStatus: ))
//   }
// }


import '../../barrel.dart';

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
      return null;
    });
  }

 
}

