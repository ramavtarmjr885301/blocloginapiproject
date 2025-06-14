
import '../../barrel.dart';

class Authstate extends Equatable {
  final ApiStatus loginStatus;

  const Authstate({this.loginStatus = ApiStatus.initialState});

  Authstate copyWith({ApiStatus? loginStatus}) {
    return Authstate(loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object> get props => [loginStatus];
}
