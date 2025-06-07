// static Route<dynamic> generateRoute(RouteSettings settings)
import 'package:bloc_practice/routes/routes_names.dart';
import 'package:bloc_practice/views/counter_Screen.dart';
import 'package:bloc_practice/views/home_screen.dart';
import 'package:bloc_practice/views/loginScreen.dart';
import 'package:flutter/material.dart';

// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings, settings) {
//     switch (settings.name) {
//       case RoutesNames.loginScreen:
//         return MaterialPageRoute(builder: (context) => const Loginscreen());
//       case RoutesNames.homeScreen:
//         return MaterialPageRoute(builder: (context) => const HomeScreen());
//       case RoutesNames.counterScreen:
//         return MaterialPageRoute(builder: (context) => const CounterScreen());
//       default:
//         return MaterialPageRoute(
//           builder: (context) {
//             return const Scaffold(
//               body: Center(
//                 child: Text("No route found!"),
//               ),
//             );
//           },
//         );
//     }
//   }
// }

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const Loginscreen());
      case RoutesNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesNames.counterScreen:
        return MaterialPageRoute(builder: (context) => const CounterScreen());
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
