
import 'package:bloc_practice/BLoC/DataBloc/data_bloc.dart';
import 'package:bloc_practice/BLoC/auth_Bloc/auth_bloc.dart';
import 'package:bloc_practice/BLoC/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/routes/routes.dart';
import 'package:bloc_practice/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => DataBloc(),
          )
        ],
        child: const MaterialApp(
          initialRoute: RoutesNames.loginScreen,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
