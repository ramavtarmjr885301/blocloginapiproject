

import '../../barrel.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
  @override
  List<Object?> get props => [];

}
class DataFetchEvent extends DataEvent{
  
}


// // emit(); => like setState(){}
//     emit(state.copyWith(datastatus: ApiStatus.loadingState));
//     await _datalistRepo.fetchList().then((value){}).onError((error, stackTrace) {
//       print(error);
//       emit(state.copyWith(datastatus: ApiStatus.errorState));
//     });