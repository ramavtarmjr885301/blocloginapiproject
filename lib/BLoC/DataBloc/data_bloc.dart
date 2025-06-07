import 'package:bloc_practice/BLoC/DataBloc/data_event.dart';
import 'package:bloc_practice/BLoC/DataBloc/data_state.dart';
import 'package:bloc_practice/Repos/dataListRepo.dart';
import 'package:bloc_practice/utils/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DatalistRepo _datalistRepo = DatalistRepo();
  DataBloc() : super(const DataState()) {
    on<DataFetchEvent>(_fetchData);
  }

  _fetchData(DataFetchEvent event, Emitter<DataState> emit) async {
    emit(state.copyWith(datastatus: ApiStatus.loadingState, postsData: []));
    await _datalistRepo.fetchList().then((value) {
      emit(
          state.copyWith(datastatus: ApiStatus.successState, postsData: value));
      // print(_datalistRepo.fetchList());
    }).onError(
      (error, stackTrace) {},
    );
  }
}
//