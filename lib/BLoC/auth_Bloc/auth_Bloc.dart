import 'package:bloc/bloc.dart';
import 'package:blocloginapiproject/BLoC/auth_Bloc/authEvent.dart';
import 'package:blocloginapiproject/BLoC/auth_Bloc/authState.dart';
import 'package:blocloginapiproject/BLoC/model/loginResponseModel.dart';
import 'package:blocloginapiproject/Repos/login_repo.dart';

class AuthBloc extends Bloc<AuthEvent, Authstate> {
  AuthBloc() : super(LoginInitialState()) {
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        LoginResponseModel loginResponseModel = await LoginRepo().login(
            event.loginReqModel?.username ?? "",
            event.loginReqModel?.password ?? "");
        emit(LoginSuccessState(loginResponseModel: loginResponseModel));
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}
