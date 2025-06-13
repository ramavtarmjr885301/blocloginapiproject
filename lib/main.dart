
import 'package:bloc_practice/BLoC/local_auth_bloc/local_auth_bloc.dart';
import 'package:bloc_practice/BLoC/local_notes_bloc/local_notes_bloc.dart';

import 'barrel.dart';


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
          ),
          BlocProvider(
            create: (context) => LocalAuthBloc(),
          ),
           BlocProvider(
            create: (context) => NoteBloc(),
          )
        ],
        child: const MaterialApp(
          initialRoute: RoutesNames.commonScreen,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
