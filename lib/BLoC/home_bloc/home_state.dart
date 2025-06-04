import 'package:blocloginapiproject/BLoC/model/postsListModel.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class FetchListInitialState extends HomeState {
  @override
 
  List<Object?> get props => [];
}

class FetchListLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchListSuccessState extends HomeState {

  final List<PostsListsModel> posts;
  FetchListSuccessState(this.posts);
  @override
  List<Object?> get props => [posts];
}

class FetchListErrorState extends HomeState {
  final String errorMsg;
  FetchListErrorState({ required this.errorMsg});
  @override
  
  List<Object?> get props => [errorMsg];
}
