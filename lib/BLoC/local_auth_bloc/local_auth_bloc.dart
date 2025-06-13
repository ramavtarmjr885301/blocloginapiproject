import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_event.dart';
import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_state.dart';
import 'package:bloc_practice/data/db/database_helper.dart';
import 'package:bloc_practice/views/local_users_views/local_notes_screen.dart';
import '../../barrel.dart';
class LocalAuthBloc extends Bloc<LocalAuthEvent, LocalAuthState> {
  final LocalDatabaseHelper dbHelper=LocalDatabaseHelper();

  LocalAuthBloc() : super(const LocalAuthState()) {
    on<LocalSignUpRequested>(_onSignUp);
    on<LocalLoginRequested>(_onLogin);
    // on<LocalSignOutRequested>(_onSignOut);
  }

  Future<void> _onSignUp(LocalSignUpRequested event, Emitter<LocalAuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final user = LocalUserModel(
        
        username: event.username,
        email: event.email,
        password: event.password,
        mobileNumber: event.mobileNumber
      );
      await dbHelper.insertUser(user);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Signup failed: ${e.toString()}"));
    }
  }

   _onLogin(LocalLoginRequested event, Emitter<LocalAuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final user = await dbHelper.getUser(event.email, event.password);
      if (user != null) {
        emit(state.copyWith(isLoading: false, user: user));
        return Navigator.push(event.context, MaterialPageRoute(builder: (context) => LocalNotesScreen(user: user,),));
      } else {
        emit(state.copyWith(isLoading: false, error: "Invalid credentials"));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Login failed: ${e.toString()}"));
    }
  }
}


//  _login(LocalLoginRequested event, Emitter<LocalAuthState> emit) async {
//     emit(state.copyWith(loginStatus: ApiStatus.loadingState));
//     await dbHelper.getUser(event.email, event.password).then((value) {
//       print(value!.email);

//       emit(state.copyWith(loginStatus: ApiStatus.successState));
//       return Navigator.pushNamed(event.context,RoutesNames.localHomeScreen);
//     }).onError((error, stackTrace) {
//       print(error);
//       emit(state.copyWith(loginStatus: ApiStatus.errorState));
//       return null;
//     });
//   }

////////////////////////


// class LocalAuthState extends Equatable {
//   final bool isLoading;
//   final LocalUserModel? user;
//   final String? error;

//   const LocalAuthState({
//     this.isLoading = false,
//     this.user,
//     this.error,
//   });

//   LocalAuthState copyWith({
//     bool? isLoading,
//     LocalUserModel? user,
//     String? error,
//   }) {
//     return LocalAuthState(
//       isLoading: isLoading ?? this.isLoading,
//       user: user ?? this.user,
//       error: error,
//     );
//   }

//   @override
//   List<Object?> get props => [isLoading, user, error];
// }

// class LocalAuthState extends Equatable {
//   final ApiStatus loginStatus;
//   final LocalUserModel? user;


//   const LocalAuthState({this.loginStatus = ApiStatus.initialState, this.user});

//   LocalAuthState copyWith({ApiStatus? loginStatus,LocalUserModel? user}) {
//     return LocalAuthState(loginStatus: loginStatus ?? this.loginStatus,
//     user: user??this.user
//     );
//   }

//   @override
//   List<Object> get props => [loginStatus, user];
// }
