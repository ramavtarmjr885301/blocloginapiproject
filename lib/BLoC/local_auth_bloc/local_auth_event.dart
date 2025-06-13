import 'package:bloc_practice/barrel.dart';

abstract class LocalAuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocalSignUpRequested extends LocalAuthEvent {
  final String username, email, password;
  final String mobileNumber;

  LocalSignUpRequested(
      this.username, this.email, this.password, this.mobileNumber);

  @override
  List<Object?> get props => [username, email, password, mobileNumber];
}

class LocalLoginRequested extends LocalAuthEvent {
  final String email, password;
  final BuildContext context;

  LocalLoginRequested({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        context,
      ];
}
class LocalSignOutRequested extends LocalAuthEvent{}