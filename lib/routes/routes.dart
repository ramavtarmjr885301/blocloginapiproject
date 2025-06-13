import 'package:bloc_practice/views/common_screen.dart';
import 'package:bloc_practice/views/local_users_views/local_login_screen.dart';
import 'package:bloc_practice/views/local_users_views/local_signup_screen.dart';
import '../barrel.dart';
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const Loginscreen());
      case RoutesNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesNames.counterScreen:
        return MaterialPageRoute(builder: (context) => const CounterScreen());
        case RoutesNames.commonScreen:
        return MaterialPageRoute(builder: (context) => const CommonScreen());
        case RoutesNames.localLoginScreen:
        return MaterialPageRoute(builder: (context) => const LocalLoginScreen());
        // case RoutesNames.localHomeScreen:
        // return MaterialPageRoute(builder: (context) => const LocalHomeScreen());
        // case RoutesNames.localProfileScreen:
        // return MaterialPageRoute(builder: (context) => const LocalProfileScreen());
        //  case RoutesNames.localHome:
        // return MaterialPageRoute(builder: (context) => const LocalHome(user:));
         case RoutesNames.localSignUpScreen:
        return MaterialPageRoute(builder: (context) =>  LocalSignupScreen());
        // case RoutesNames.localNotesScreen:
        // return MaterialPageRoute(builder: (context) =>  LocalNotesScreen(user: ,));
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No route found!"),
              ),
            );
          },
        );
    }
  }
}
