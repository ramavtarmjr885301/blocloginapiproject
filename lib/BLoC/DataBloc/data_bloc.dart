

import '../../barrel.dart';

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