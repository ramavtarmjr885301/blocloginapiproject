import 'package:blocloginapiproject/BLoC/auth_Bloc/auth_Bloc.dart';
import 'package:blocloginapiproject/views/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider(create: (context) => AuthBloc(),)], child: MaterialApp(
      home: Loginscreen(),
    ));
  }
}
