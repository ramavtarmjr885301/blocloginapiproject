// static Route<dynamic> generateRoute(RouteSettings settings)
import 'package:blocloginapiproject/routes/routes_names.dart';
import 'package:blocloginapiproject/views/counter_Screen.dart';
import 'package:blocloginapiproject/views/home_screen.dart';
import 'package:blocloginapiproject/views/loginScreen.dart';
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
