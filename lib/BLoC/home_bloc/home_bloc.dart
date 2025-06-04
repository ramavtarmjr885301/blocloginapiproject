import 'package:bloc/bloc.dart';
import 'package:blocloginapiproject/BLoC/home_bloc/home_state.dart';
import 'package:blocloginapiproject/BLoC/home_bloc/home_event.dart';
import 'package:blocloginapiproject/Repos/dataListRepo.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState>{


  final DatalistRepo repository;

  HomeBloc( {required this.repository}) : super(FetchListInitialState()) {
    on<FetchListEvent>((event, emit) async {
      emit(FetchListLoadingState());
      try {
        final posts = await repository.fetchList();
        emit(FetchListSuccessState(posts));
      } catch (e) {
        emit(FetchListErrorState(errorMsg:e.toString()));
      }
    });
   
  }
}