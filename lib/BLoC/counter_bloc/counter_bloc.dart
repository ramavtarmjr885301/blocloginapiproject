

import '../../barrel.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }
  // syntax
  // functionName(eventName event, Emitter<stateName> emit){}
  void _increment(IncrementEvent event, Emitter<CounterState> emit) {
    // emit(); => like setState(){}
    emit(state.copyWith(counter: state.counter+1));
  }
  void _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    // emit(); => like setState(){}
    emit(state.copyWith(counter: state.counter-1));
  }
}
