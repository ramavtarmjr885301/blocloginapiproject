import 'package:blocloginapiproject/BLoC/auth_Bloc/auth_bloc.dart';
import 'package:blocloginapiproject/BLoC/home_bloc/home_bloc.dart';
import 'package:blocloginapiproject/Repos/dataListRepo.dart';
import 'package:blocloginapiproject/views/loginScreen.dart';
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
            create: (context) => HomeBloc(repository: DatalistRepo()),
          )
        ],
        child:const MaterialApp(
          home: Loginscreen(),
        ));
  }
}
