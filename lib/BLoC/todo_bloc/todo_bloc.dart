import 'package:bloc_practice/BLoC/todo_bloc/todo_event.dart';
import 'package:bloc_practice/BLoC/todo_bloc/todo_state.dart';
import 'package:bloc_practice/barrel.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState>{
  ToDoBloc():super(const ToDoState()){
    on<ToDoAddEvent>(_addevent);
  }

  void _addevent(ToDoAddEvent event, Emitter<ToDoState>emit ){}

}