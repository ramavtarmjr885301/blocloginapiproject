import 'package:bloc_practice/data/model/local_user_model.dart';
import '../../barrel.dart';

class LocalAuthState extends Equatable {
  final bool isLoading;
  final LocalUserModel? user;
  final String? error;
  

  const LocalAuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  LocalAuthState copyWith({
    bool? isLoading,
    LocalUserModel? user,
    String? error,
  }) {
    return LocalAuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, user, error];
}

// class LocalAuthState extends Equatable {
//   final ApiStatus loginStatus;
//   final LocalUserModel? user;
//   final String? error;

//   const LocalAuthState({this.loginStatus = ApiStatus.loadingState, this.user, this.error});

//   LocalAuthState copyWith({ApiStatus? loginStatus, LocalUserModel? user, String? error}) {
//     return LocalAuthState(
//         loginStatus: loginStatus ?? this.loginStatus, user: user ?? this.user, error: error ?? this.error);
//   }

//   @override
//   List<Object?> get props => [loginStatus, user, error];
// }
