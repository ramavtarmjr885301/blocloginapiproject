
import '../../barrel.dart';

class CounterState extends Equatable{
  final int counter;
 const CounterState({this.counter=0});
// copyWith structure
// className copyWith({}){}
  CounterState copyWith({int? counter}){
    return CounterState(counter:counter?? this.counter);
  }
  @override
  List<Object?> get props => [counter];
}